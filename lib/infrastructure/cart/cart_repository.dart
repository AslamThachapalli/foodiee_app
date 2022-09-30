import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../domain/cart/cart.dart';
import '../../domain/cart/i_cart_repository.dart';
import '../../domain/cart/cart_item.dart';
import '../../domain/cart/value_objects.dart';
import '../../domain/core/value_object.dart';
import '../../domain/product_fetching/value_objects.dart';
import './cart_dtos.dart';

@LazySingleton(as: ICartRepository)
class CartRepository implements ICartRepository {
  Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'cart.db'),
      version: 1,
      onCreate: (db, version) => _onCreate(db, version),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE cart(cartId STRING PRIMARY KEY , quantity INTEGER, amount INTEGER, createdAt STRING)');
    await db.execute('CREATE TABLE cart_items(productId STRING PRIMARY KEY, name STRING, imageUrl STRING, price INTEGER, quantity INTEGER, isExist INTEGER)');
  }

  @override
  Future<Option<int>> getCartCount() async {
    final db = await database();

    final cartMapList = await db.query('cart', columns: ['quantity']);
    if (cartMapList.isEmpty) {
      return none();
    } else {
      int cartQuantity = cartMapList[0]['quantity'] as int;
      return some(cartQuantity);
    }
  }

  @override
  Future<Option<Cart>> getCart() async {
    final db = await database();

    final cartMapList = await db.query('cart');
    if (cartMapList.isNotEmpty) {
      final cartList = cartMapList.map((cartMap) => CartDto.fromJson(cartMap).toDomain()).toList();
      final cartItemMapList = await db.query('cart_items');
      final cartItemList = cartItemMapList
          .map(
            (cartItemMap) => CartItemDto.fromJson(cartItemMap).toDomain(),
          )
          .toList();
      return some(cartList[0].copyWith(items: cartItemList));
    } else {
      return none();
    }
  }

  @override
  Future<Cart> addToCart({UniqueId? cartId, CreatedAt? createdAt, required CartItem cartItem}) async {
    final db = await database();

    if (cartId == null) {
      final cartItemQuantityList = await db.query(
        'cart_items',
        columns: ['quantity'],
        where: 'productId=?',
        whereArgs: [cartItem.productId.getOrCrash()],
      );
      final cartMapList = await db.query(
        'cart',
        columns: ['quantity', 'amount'],
      );
      int cartQuantity;
      int cartAmount;
      if (cartItemQuantityList.isNotEmpty) {
        await db.update(
          'cart_items',
          {'quantity': cartItem.quantity.getOrCrash()},
          where: 'productId=?',
          whereArgs: [cartItem.productId.getOrCrash()],
        );

        cartQuantity = (cartMapList[0]['quantity'] as int) - (cartItemQuantityList[0]['quantity'] as int);
        cartQuantity += cartItem.quantity.getOrCrash();

        cartAmount = (cartMapList[0]['amount'] as int) - ((cartItemQuantityList[0]['quantity'] as int) * cartItem.price.getOrCrash());
        cartAmount += (cartItem.quantity.getOrCrash() * cartItem.price.getOrCrash());
      } else {
        await db.insert(
          'cart_items',
          CartItemDto.fromDomain(cartItem).toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        cartQuantity = cartMapList[0]['quantity'] as int;
        cartQuantity += cartItem.quantity.getOrCrash();

        cartAmount = cartMapList[0]['amount'] as int;
        cartAmount += (cartItem.quantity.getOrCrash() * cartItem.price.getOrCrash());
      }

      await db.update('cart', {
        'quantity': cartQuantity,
        'amount': cartAmount,
      });

      final cartOption = await getCart();
      Cart? cart = cartOption.fold(
        () => null,
        id,
      );
      return cart!;
    } else {
      await db.insert(
        'cart_items',
        CartItemDto.fromDomain(cartItem).toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      int cartQuantity = cartItem.quantity.getOrCrash();
      int cartAmount = (cartItem.quantity.getOrCrash() * cartItem.price.getOrCrash());

      await db.insert('cart', {
        'cartId': cartId.getOrCrash(),
        'createdAt': createdAt!.getOrCrash(),
        'quantity': cartQuantity,
        'amount': cartAmount,
      });

      final cartOption = await getCart();
      Cart? cart = cartOption.fold(
        () => null,
        id,
      );
      return cart!;
    }
  }

  @override
  Future<Cart> updateCart({
    required UniqueId productId,
    required Quantity quantity,
    required Price price,
    required bool isIncrementing,
  }) async {
    final db = await database();

    await db.update(
      'cart_items',
      {'quantity': quantity.getOrCrash()},
      where: 'productId=?',
      whereArgs: [productId.getOrCrash()],
    );

    final cartMapList = await db.query(
      'cart',
      columns: ['quantity', 'amount'],
    );

    int cartQuantity = cartMapList[0]['quantity'] as int;
    isIncrementing ? cartQuantity += 1 : cartQuantity -= 1;

    int cartAmount = cartMapList[0]['amount'] as int;
    isIncrementing ? cartAmount += price.getOrCrash() : cartAmount -= price.getOrCrash();

    await db.update('cart', {
      'quantity': cartQuantity,
      'amount': cartAmount,
    });

    final cartOption = await getCart();
    Cart? cart = cartOption.fold(
      () => null,
      id,
    );
    return cart!;
  }

  @override
  Future<Option<Cart>> deleteFromCart(
    UniqueId productId,
    Price price,
  ) async {
    final db = await database();

    await db.delete(
      'cart_items',
      where: 'productId=?',
      whereArgs: [productId.getOrCrash()],
    );
    final cartItemsQuery = await db.query('cart_items');
    if (cartItemsQuery.isEmpty) {
      await db.delete('cart');
      return none();
    }
    final cartMapList = await db.query(
      'cart',
      columns: ['quantity', 'amount'],
    );

    int cartQuantity = cartMapList[0]['quantity'] as int;
    cartQuantity -= 1;
    int cartAmount = cartMapList[0]['amount'] as int;
    cartAmount -= price.getOrCrash();

    await db.update('cart', {
      'quantity': cartQuantity,
      'amount': cartAmount,
    });

    final cartOption = await getCart();
    Cart? cart = cartOption.fold(
      () => null,
      id,
    );
    return some(cart!);
  }
}

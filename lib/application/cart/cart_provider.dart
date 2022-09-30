import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../domain/cart/cart.dart';
import '../../domain/cart/cart_item.dart';
import '../../domain/cart/i_cart_repository.dart';
import '../../domain/cart/value_objects.dart';
import '../../domain/core/value_object.dart';
import '../../domain/product_fetching/value_objects.dart';

@injectable
class CartProvider with ChangeNotifier {
  final ICartRepository _cartRepository;
  CartProvider(this._cartRepository);

  Cart _cart = Cart.empty();
  int _cartCount = 0;

  Cart get cart => _cart;
  int get cartCount => _cartCount;

  Future<void> productDetailPageOpened() async {
    final cartCountOption = await _cartRepository.getCartCount();
    _cartCount = cartCountOption.fold(
      () => 0,
      id,
    );
    notifyListeners();
  }

  Future<void> openCartButtonPressed() async {
    final cartOption = await _cartRepository.getCart();
    return cartOption.fold(
      () {
        _cart = Cart.empty();
        notifyListeners();
      },
      (cart) {
        _cart = cart;
        _cartCount = cart.quantity.getOrCrash();
        notifyListeners();
      },
    );
  }

  Future<void> addToCartPressed({
    required String productId,
    required int productCount,
    required int price,
    required String name,
    required String imageUrl,
    bool isExist = true,
  }) async {
    final cartOption = await _cartRepository.getCart();

    if (cartOption.isNone()) {
      _cart = await _cartRepository.addToCart(
        cartId: UniqueId.fromUuid(),
        createdAt: CreatedAt(DateFormat('dd-MM-YYYY hh:mm a').format(DateTime.now())),
        cartItem: CartItem(
          productId: UniqueId(productId),
          name: ProductName(name),
          imageUrl: ImageUrl(imageUrl),
          price: Price(price),
          quantity: Quantity(productCount),
          isExist: isExist,
        ),
      );
    } else {
      _cart = await _cartRepository.addToCart(
        cartItem: CartItem(
          productId: UniqueId(productId),
          name: ProductName(name),
          imageUrl: ImageUrl(imageUrl),
          price: Price(price),
          quantity: Quantity(productCount),
          isExist: isExist,
        ),
      );
    }
    _cartCount = _cart.quantity.getOrCrash();
    notifyListeners();
  }

  Future<void> incrementCartItemQuantityPressed({
    required String productId,
    required int currentQuantity,
    required int productPrice,
  }) async {
    int quantity = currentQuantity + 1;
    _cart = await _cartRepository.updateCart(
      productId: UniqueId(productId),
      quantity: Quantity(quantity),
      price: Price(productPrice),
      isIncrementing: true,
    );
    _cartCount = _cart.quantity.getOrCrash();
    notifyListeners();
  }

  Future<void> decrementCartItemQuantityPressed({
    required String productId,
    required int currentQuantity,
    required int productPrice,
  }) async {
    int quantity = currentQuantity - 1;
    if (quantity == 0) {
      final carOption = await _cartRepository.deleteFromCart(
        UniqueId(productId),
        Price(productPrice),
      );
      _cart = carOption.fold(
        () => Cart.empty(),
        id,
      );
    } else {
      _cart = await _cartRepository.updateCart(
        productId: UniqueId(productId),
        quantity: Quantity(quantity),
        price: Price(productPrice),
        isIncrementing: false,
      );
    }
    _cartCount = _cart.quantity.getOrCrash();
    notifyListeners();
  }
}

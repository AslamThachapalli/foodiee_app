import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:foodiee_app/domain/product_fetching/value_objects.dart';

import '../core/value_object.dart';
import './value_objects.dart';
import './cart.dart';
import './cart_item.dart';

abstract class ICartRepository {
  Future<Option<int>> getCartCount();
  Future<Option<Cart>> getCart();
  Future<Cart> addToCart({UniqueId? cartId, CreatedAt? createdAt, required CartItem cartItem});
  Future<Cart> updateCart(
      {required UniqueId productId,
      required Quantity quantity,
      required Price price,
      required bool isIncrementing});
  Future<Option<Cart>> deleteFromCart(UniqueId productId, Price price);
  Future<Unit> deleteCart();
  Future<Cart> addCart(Cart cart);
}

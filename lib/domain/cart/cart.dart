import 'package:freezed_annotation/freezed_annotation.dart';

import './cart_item.dart';
import './value_objects.dart';
import '../core/value_object.dart';

part 'cart.freezed.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    required UniqueId cartId,
    required Quantity quantity,
    required Amount amount,
    required List<CartItem> items,
    required CreatedAt createdAt,
  }) = _Cart;

  factory Cart.empty() => Cart(
        cartId: UniqueId.fromUuid(),
        quantity: Quantity(0),
        amount: Amount(0),
        items: <CartItem>[],
        createdAt: CreatedAt(''),
      );
}

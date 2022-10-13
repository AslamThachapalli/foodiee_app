import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/cart/cart.dart';
import '../../domain/cart/cart_item.dart';
import '../../domain/cart/value_objects.dart';
import '../../domain/core/value_object.dart';
import '../../domain/product_fetching/value_objects.dart';

part 'cart_history_dtos.freezed.dart';
part 'cart_history_dtos.g.dart';

@freezed
class CartHistoryDto with _$CartHistoryDto {
  const CartHistoryDto._();

  @JsonSerializable(explicitToJson: true)
  const factory CartHistoryDto({
    required String cartId,
    required int quantity,
    required int amount,
    required List<CartItemDto>? cartItems,
    required String createdAt,
    @ServerTimestampConverter() required FieldValue serverTimeStamp,
  }) = _CartHistoryDto;

  factory CartHistoryDto.fromDomain(Cart cart) {
    return CartHistoryDto(
      cartId: cart.cartId.getOrCrash(),
      quantity: cart.quantity.getOrCrash(),
      amount: cart.amount.getOrCrash(),
      cartItems: cart.items.map((cartItem) => CartItemDto.fromDomain(cartItem)).toList(),
      createdAt: cart.createdAt.getOrCrash(),
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  Cart toDomain() {
    return Cart(
      cartId: UniqueId(cartId),
      quantity: Quantity(quantity),
      amount: Amount(amount),
      items: cartItems == null ? <CartItem>[] : cartItems!.map((dto) => dto.toDomain()).toList(),
      createdAt: CreatedAt(createdAt),
    );
  }

  factory CartHistoryDto.fromJson(Map<String, dynamic> json) => _$CartHistoryDtoFromJson(json);
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}

@freezed
class CartItemDto with _$CartItemDto {
  const CartItemDto._();

  const factory CartItemDto({
    required String productId,
    required String name,
    required String imageUrl,
    required int price,
    required int quantity,
  }) = _CartItemDto;

  factory CartItemDto.fromDomain(CartItem cartItem) {
    return CartItemDto(
      productId: cartItem.productId.getOrCrash(),
      name: cartItem.name.getOrCrash(),
      imageUrl: cartItem.imageUrl.getOrCrash()!,
      price: cartItem.price.getOrCrash(),
      quantity: cartItem.quantity.getOrCrash(),
    );
  }

  CartItem toDomain() {
    return CartItem(
      productId: UniqueId(productId),
      name: ProductName(name),
      imageUrl: ImageUrl(imageUrl),
      price: Price(price),
      quantity: Quantity(quantity),
    );
  }

  factory CartItemDto.fromJson(Map<String, dynamic> json) => _$CartItemDtoFromJson(json);
}

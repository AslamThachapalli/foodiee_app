// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartDto _$$_CartDtoFromJson(Map<String, dynamic> json) => _$_CartDto(
      cartId: json['cartId'] as String,
      quantity: json['quantity'] as int,
      amount: json['amount'] as int,
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$_CartDtoToJson(_$_CartDto instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'quantity': instance.quantity,
      'amount': instance.amount,
      'cartItems': instance.cartItems?.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt,
    };

_$_CartItemDto _$$_CartItemDtoFromJson(Map<String, dynamic> json) =>
    _$_CartItemDto(
      productId: json['productId'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as int,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$_CartItemDtoToJson(_$_CartItemDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'quantity': instance.quantity,
    };

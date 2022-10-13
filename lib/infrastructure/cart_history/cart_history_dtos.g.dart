// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_history_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartHistoryDto _$$_CartHistoryDtoFromJson(Map<String, dynamic> json) =>
    _$_CartHistoryDto(
      cartId: json['cartId'] as String,
      quantity: json['quantity'] as int,
      amount: json['amount'] as int,
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      serverTimeStamp: const ServerTimestampConverter()
          .fromJson(json['serverTimeStamp'] as Object),
    );

Map<String, dynamic> _$$_CartHistoryDtoToJson(_$_CartHistoryDto instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'quantity': instance.quantity,
      'amount': instance.amount,
      'cartItems': instance.cartItems?.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt,
      'serverTimeStamp':
          const ServerTimestampConverter().toJson(instance.serverTimeStamp),
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

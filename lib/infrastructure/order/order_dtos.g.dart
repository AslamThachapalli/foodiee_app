// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDtos _$$_OrderDtosFromJson(Map<String, dynamic> json) => _$_OrderDtos(
      orderId: json['orderId'] as String,
      paymentId: json['paymentId'] as String,
      orderedOn: json['orderedOn'] as String,
      cartId: json['cartId'] as String,
      serverTimeStamp: const ServerTimestampConverter()
          .fromJson(json['serverTimeStamp'] as Object),
    );

Map<String, dynamic> _$$_OrderDtosToJson(_$_OrderDtos instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'paymentId': instance.paymentId,
      'orderedOn': instance.orderedOn,
      'cartId': instance.cartId,
      'serverTimeStamp':
          const ServerTimestampConverter().toJson(instance.serverTimeStamp),
    };

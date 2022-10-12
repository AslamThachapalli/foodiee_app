import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/order/order.dart';
import '../../domain/order/value_objects.dart';

part 'order_dtos.freezed.dart';
part 'order_dtos.g.dart';

@freezed
class OrderDtos with _$OrderDtos {
  const OrderDtos._();

  @JsonSerializable(explicitToJson: true)
  const factory OrderDtos({
    required String orderId,
    required String paymentId,
    required String orderedOn,
    required String cartId,
    @ServerTimestampConverter() required FieldValue serverTimeStamp,
  }) = _OrderDtos;

  factory OrderDtos.fromDomain(Order order) {
    return OrderDtos(
      orderId: order.orderId.getOrCrash(),
      paymentId: order.paymentId.getOrCrash(),
      orderedOn: order.orderedOn.getOrCrash(),
      cartId: order.cartId.getOrCrash(),
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  Order toDomain() {
    return Order(
      orderId: OrderId(orderId),
      paymentId: PaymentId(paymentId),
      orderedOn: OrderedOn(orderedOn),
      cartId: CartId(cartId),
    );
  }

  factory OrderDtos.fromJson(Map<String, dynamic> json) => _$OrderDtosFromJson(json);
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

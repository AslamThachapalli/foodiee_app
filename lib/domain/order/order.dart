import 'package:freezed_annotation/freezed_annotation.dart';

import './value_objects.dart';

part 'order.freezed.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required OrderId orderId,
    required PaymentId paymentId,
    required OrderedOn orderedOn,
    required CartId cartId,
  }) = _Order;

  factory Order.empty() => Order(
        orderId: OrderId(''),
        paymentId: PaymentId(''),
        orderedOn: OrderedOn(''),
        cartId: CartId(''),
      );
}

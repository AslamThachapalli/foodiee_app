import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../core/value_object.dart';

class OrderId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory OrderId(String input) {
    return OrderId._(right(input));
  }

  const OrderId._(this.value);
}

class PaymentId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentId(String input) {
    return PaymentId._(right(input));
  }

  const PaymentId._(this.value);
}

class OrderedOn extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory OrderedOn(String input) {
    return OrderedOn._(right(input));
  }

  const OrderedOn._(this.value);
}

class CartId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CartId(String input) {
    return CartId._(right(input));
  }

  const CartId._(this.value);
}

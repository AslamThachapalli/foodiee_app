import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../core/value_object.dart';

class Amount extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory Amount(int totalAmount) {
    return Amount._(
      right(totalAmount),
    );
  }

  const Amount._(this.value);
}

class CreatedAt extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CreatedAt(String dateTime) {
    return CreatedAt._(
      right(dateTime),
    );
  }

  const CreatedAt._(this.value);
}

class Quantity extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory Quantity(int quantity) {
    return Quantity._(
      right(quantity),
    );
  }

  const Quantity._(this.value);
}

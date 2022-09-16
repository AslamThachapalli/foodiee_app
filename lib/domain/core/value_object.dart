import 'package:flutter/foundation.dart';

import 'package:dartz/dartz.dart';

import './failures.dart';
import './errror.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId(String uniqueId) {
    return UniqueId._(
      right(uniqueId),
    );
  }

  const UniqueId._(this.value);
}

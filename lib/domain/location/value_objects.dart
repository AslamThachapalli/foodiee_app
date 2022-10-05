import 'package:dartz/dartz.dart';

import '../core//failures.dart';
import '../core//value_object.dart';

class Latitude extends ValueObject<double?> {
  @override
  final Either<ValueFailure<double?>, double?> value;

  factory Latitude(double? input) {
    return Latitude._(right(input));
  }

  const Latitude._(this.value);
}

class Longitude extends ValueObject<double?> {
  @override
  final Either<ValueFailure<double?>, double?> value;

  factory Longitude(double? input) {
    return Longitude._(right(input));
  }

  const Longitude._(this.value);
}

class Location extends ValueObject<String?> {
  @override
  final Either<ValueFailure<String?>, String?> value;

  factory Location(String? input) {
    return Location._(right(input));
  }

  const Location._(this.value);
}

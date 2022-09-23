import 'package:dartz/dartz.dart';

import 'package:foodiee_app/domain/core/failures.dart';

import '../core/value_object.dart';

class ProductName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ProductName(String input) {
    return ProductName._(right(input));
  }

  const ProductName._(this.value);
}

class Description extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Description(String input) {
    return Description._(right(input));
  }

  const Description._(this.value);
}

class ImageUrl extends ValueObject<String?> {
  @override
  final Either<ValueFailure<String?>, String?> value;

  factory ImageUrl(String? input) {
    return ImageUrl._(right(input));
  }

  const ImageUrl._(this.value);
}

class Location extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Location(String input) {
    return Location._(right(input));
  }

  const Location._(this.value);
}

class Price extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory Price(int input) {
    return Price._(right(input));
  }

  const Price._(this.value);
}

class Stars extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory Stars(int input) {
    return Stars._(right(input));
  }

  const Stars._(this.value);
}

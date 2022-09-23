import 'package:freezed_annotation/freezed_annotation.dart';

import './value_objects.dart';
import '../core/value_object.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required UniqueId id,
    required ProductName name,
    required Description description,
    required ImageUrl imageUrl,
    required Location location,
    required Price price,
    required Stars stars,
  }) = _Product;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/value_object.dart';
import '../product_fetching/value_objects.dart';
import './value_objects.dart';

part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required UniqueId productId,
    required ProductName name,
    required ImageUrl imageUrl,
    required Price price,
    required Quantity quantity,
  }) = _CartItem;
}

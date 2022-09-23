import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/core/value_object.dart';
import '../../domain/product_fetching/product.dart';
import '../../domain/product_fetching/value_objects.dart';

part 'product_dtos.freezed.dart';
part 'product_dtos.g.dart';

@freezed
class ProductDtos with _$ProductDtos {
  const ProductDtos._();

  @JsonSerializable(explicitToJson: true)
  const factory ProductDtos({
    @JsonKey(ignore: true) String? id,
    required String name,
    required String description,
    required String? imageUrl,
    required String location,
    required int price,
    required int stars,
  }) = _ProductDtos;

  Product toDomain() {
    return Product(
      id: UniqueId(id!),
      name: ProductName(name),
      description: Description(description),
      imageUrl: ImageUrl(imageUrl),
      location: Location(location),
      price: Price(price),
      stars: Stars(stars),
    );
  }

  factory ProductDtos.fromJson(Map<String, dynamic> json) =>
      _$ProductDtosFromJson(json);

  factory ProductDtos.fromFirebase(DocumentSnapshot doc) {
    return ProductDtos.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}

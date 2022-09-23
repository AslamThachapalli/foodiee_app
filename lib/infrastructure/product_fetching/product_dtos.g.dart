// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDtos _$$_ProductDtosFromJson(Map<String, dynamic> json) =>
    _$_ProductDtos(
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,
      location: json['location'] as String,
      price: json['price'] as int,
      stars: json['stars'] as int,
    );

Map<String, dynamic> _$$_ProductDtosToJson(_$_ProductDtos instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'location': instance.location,
      'price': instance.price,
      'stars': instance.stars,
    };

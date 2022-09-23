// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductDtos _$ProductDtosFromJson(Map<String, dynamic> json) {
  return _ProductDtos.fromJson(json);
}

/// @nodoc
mixin _$ProductDtos {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get stars => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDtosCopyWith<ProductDtos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDtosCopyWith<$Res> {
  factory $ProductDtosCopyWith(
          ProductDtos value, $Res Function(ProductDtos) then) =
      _$ProductDtosCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String name,
      String description,
      String? imageUrl,
      String location,
      int price,
      int stars});
}

/// @nodoc
class _$ProductDtosCopyWithImpl<$Res> implements $ProductDtosCopyWith<$Res> {
  _$ProductDtosCopyWithImpl(this._value, this._then);

  final ProductDtos _value;
  // ignore: unused_field
  final $Res Function(ProductDtos) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? location = freezed,
    Object? price = freezed,
    Object? stars = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      stars: stars == freezed
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductDtosCopyWith<$Res>
    implements $ProductDtosCopyWith<$Res> {
  factory _$$_ProductDtosCopyWith(
          _$_ProductDtos value, $Res Function(_$_ProductDtos) then) =
      __$$_ProductDtosCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String name,
      String description,
      String? imageUrl,
      String location,
      int price,
      int stars});
}

/// @nodoc
class __$$_ProductDtosCopyWithImpl<$Res> extends _$ProductDtosCopyWithImpl<$Res>
    implements _$$_ProductDtosCopyWith<$Res> {
  __$$_ProductDtosCopyWithImpl(
      _$_ProductDtos _value, $Res Function(_$_ProductDtos) _then)
      : super(_value, (v) => _then(v as _$_ProductDtos));

  @override
  _$_ProductDtos get _value => super._value as _$_ProductDtos;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? location = freezed,
    Object? price = freezed,
    Object? stars = freezed,
  }) {
    return _then(_$_ProductDtos(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      stars: stars == freezed
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ProductDtos extends _ProductDtos {
  const _$_ProductDtos(
      {@JsonKey(ignore: true) this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.location,
      required this.price,
      required this.stars})
      : super._();

  factory _$_ProductDtos.fromJson(Map<String, dynamic> json) =>
      _$$_ProductDtosFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? imageUrl;
  @override
  final String location;
  @override
  final int price;
  @override
  final int stars;

  @override
  String toString() {
    return 'ProductDtos(id: $id, name: $name, description: $description, imageUrl: $imageUrl, location: $location, price: $price, stars: $stars)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDtos &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.stars, stars));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(stars));

  @JsonKey(ignore: true)
  @override
  _$$_ProductDtosCopyWith<_$_ProductDtos> get copyWith =>
      __$$_ProductDtosCopyWithImpl<_$_ProductDtos>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductDtosToJson(
      this,
    );
  }
}

abstract class _ProductDtos extends ProductDtos {
  const factory _ProductDtos(
      {@JsonKey(ignore: true) final String? id,
      required final String name,
      required final String description,
      required final String? imageUrl,
      required final String location,
      required final int price,
      required final int stars}) = _$_ProductDtos;
  const _ProductDtos._() : super._();

  factory _ProductDtos.fromJson(Map<String, dynamic> json) =
      _$_ProductDtos.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get imageUrl;
  @override
  String get location;
  @override
  int get price;
  @override
  int get stars;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDtosCopyWith<_$_ProductDtos> get copyWith =>
      throw _privateConstructorUsedError;
}

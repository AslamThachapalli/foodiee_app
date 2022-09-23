// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Product {
  UniqueId get id => throw _privateConstructorUsedError;
  ProductName get name => throw _privateConstructorUsedError;
  Description get description => throw _privateConstructorUsedError;
  ImageUrl get imageUrl => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;
  Price get price => throw _privateConstructorUsedError;
  Stars get stars => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      ProductName name,
      Description description,
      ImageUrl imageUrl,
      Location location,
      Price price,
      Stars stars});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

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
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as ProductName,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Description,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as ImageUrl,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      stars: stars == freezed
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as Stars,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      ProductName name,
      Description description,
      ImageUrl imageUrl,
      Location location,
      Price price,
      Stars stars});
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
      : super(_value, (v) => _then(v as _$_Product));

  @override
  _$_Product get _value => super._value as _$_Product;

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
    return _then(_$_Product(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as ProductName,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Description,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as ImageUrl,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      stars: stars == freezed
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as Stars,
    ));
  }
}

/// @nodoc

class _$_Product implements _Product {
  const _$_Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.location,
      required this.price,
      required this.stars});

  @override
  final UniqueId id;
  @override
  final ProductName name;
  @override
  final Description description;
  @override
  final ImageUrl imageUrl;
  @override
  final Location location;
  @override
  final Price price;
  @override
  final Stars stars;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, imageUrl: $imageUrl, location: $location, price: $price, stars: $stars)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.stars, stars));
  }

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
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);
}

abstract class _Product implements Product {
  const factory _Product(
      {required final UniqueId id,
      required final ProductName name,
      required final Description description,
      required final ImageUrl imageUrl,
      required final Location location,
      required final Price price,
      required final Stars stars}) = _$_Product;

  @override
  UniqueId get id;
  @override
  ProductName get name;
  @override
  Description get description;
  @override
  ImageUrl get imageUrl;
  @override
  Location get location;
  @override
  Price get price;
  @override
  Stars get stars;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}

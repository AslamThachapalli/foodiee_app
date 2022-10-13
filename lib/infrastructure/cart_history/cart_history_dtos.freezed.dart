// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_history_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartHistoryDto _$CartHistoryDtoFromJson(Map<String, dynamic> json) {
  return _CartHistoryDto.fromJson(json);
}

/// @nodoc
mixin _$CartHistoryDto {
  String get cartId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  List<CartItemDto>? get cartItems => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartHistoryDtoCopyWith<CartHistoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartHistoryDtoCopyWith<$Res> {
  factory $CartHistoryDtoCopyWith(
          CartHistoryDto value, $Res Function(CartHistoryDto) then) =
      _$CartHistoryDtoCopyWithImpl<$Res>;
  $Res call(
      {String cartId,
      int quantity,
      int amount,
      List<CartItemDto>? cartItems,
      String createdAt,
      @ServerTimestampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class _$CartHistoryDtoCopyWithImpl<$Res>
    implements $CartHistoryDtoCopyWith<$Res> {
  _$CartHistoryDtoCopyWithImpl(this._value, this._then);

  final CartHistoryDto _value;
  // ignore: unused_field
  final $Res Function(CartHistoryDto) _then;

  @override
  $Res call({
    Object? cartId = freezed,
    Object? quantity = freezed,
    Object? amount = freezed,
    Object? cartItems = freezed,
    Object? createdAt = freezed,
    Object? serverTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      cartId: cartId == freezed
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItemDto>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ));
  }
}

/// @nodoc
abstract class _$$_CartHistoryDtoCopyWith<$Res>
    implements $CartHistoryDtoCopyWith<$Res> {
  factory _$$_CartHistoryDtoCopyWith(
          _$_CartHistoryDto value, $Res Function(_$_CartHistoryDto) then) =
      __$$_CartHistoryDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String cartId,
      int quantity,
      int amount,
      List<CartItemDto>? cartItems,
      String createdAt,
      @ServerTimestampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class __$$_CartHistoryDtoCopyWithImpl<$Res>
    extends _$CartHistoryDtoCopyWithImpl<$Res>
    implements _$$_CartHistoryDtoCopyWith<$Res> {
  __$$_CartHistoryDtoCopyWithImpl(
      _$_CartHistoryDto _value, $Res Function(_$_CartHistoryDto) _then)
      : super(_value, (v) => _then(v as _$_CartHistoryDto));

  @override
  _$_CartHistoryDto get _value => super._value as _$_CartHistoryDto;

  @override
  $Res call({
    Object? cartId = freezed,
    Object? quantity = freezed,
    Object? amount = freezed,
    Object? cartItems = freezed,
    Object? createdAt = freezed,
    Object? serverTimeStamp = freezed,
  }) {
    return _then(_$_CartHistoryDto(
      cartId: cartId == freezed
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      cartItems: cartItems == freezed
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItemDto>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CartHistoryDto extends _CartHistoryDto {
  const _$_CartHistoryDto(
      {required this.cartId,
      required this.quantity,
      required this.amount,
      required final List<CartItemDto>? cartItems,
      required this.createdAt,
      @ServerTimestampConverter() required this.serverTimeStamp})
      : _cartItems = cartItems,
        super._();

  factory _$_CartHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$$_CartHistoryDtoFromJson(json);

  @override
  final String cartId;
  @override
  final int quantity;
  @override
  final int amount;
  final List<CartItemDto>? _cartItems;
  @override
  List<CartItemDto>? get cartItems {
    final value = _cartItems;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String createdAt;
  @override
  @ServerTimestampConverter()
  final FieldValue serverTimeStamp;

  @override
  String toString() {
    return 'CartHistoryDto(cartId: $cartId, quantity: $quantity, amount: $amount, cartItems: $cartItems, createdAt: $createdAt, serverTimeStamp: $serverTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartHistoryDto &&
            const DeepCollectionEquality().equals(other.cartId, cartId) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.serverTimeStamp, serverTimeStamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cartId),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(_cartItems),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(serverTimeStamp));

  @JsonKey(ignore: true)
  @override
  _$$_CartHistoryDtoCopyWith<_$_CartHistoryDto> get copyWith =>
      __$$_CartHistoryDtoCopyWithImpl<_$_CartHistoryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartHistoryDtoToJson(
      this,
    );
  }
}

abstract class _CartHistoryDto extends CartHistoryDto {
  const factory _CartHistoryDto(
      {required final String cartId,
      required final int quantity,
      required final int amount,
      required final List<CartItemDto>? cartItems,
      required final String createdAt,
      @ServerTimestampConverter()
          required final FieldValue serverTimeStamp}) = _$_CartHistoryDto;
  const _CartHistoryDto._() : super._();

  factory _CartHistoryDto.fromJson(Map<String, dynamic> json) =
      _$_CartHistoryDto.fromJson;

  @override
  String get cartId;
  @override
  int get quantity;
  @override
  int get amount;
  @override
  List<CartItemDto>? get cartItems;
  @override
  String get createdAt;
  @override
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @override
  @JsonKey(ignore: true)
  _$$_CartHistoryDtoCopyWith<_$_CartHistoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItemDto _$CartItemDtoFromJson(Map<String, dynamic> json) {
  return _CartItemDto.fromJson(json);
}

/// @nodoc
mixin _$CartItemDto {
  String get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemDtoCopyWith<CartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemDtoCopyWith<$Res> {
  factory $CartItemDtoCopyWith(
          CartItemDto value, $Res Function(CartItemDto) then) =
      _$CartItemDtoCopyWithImpl<$Res>;
  $Res call(
      {String productId,
      String name,
      String imageUrl,
      int price,
      int quantity});
}

/// @nodoc
class _$CartItemDtoCopyWithImpl<$Res> implements $CartItemDtoCopyWith<$Res> {
  _$CartItemDtoCopyWithImpl(this._value, this._then);

  final CartItemDto _value;
  // ignore: unused_field
  final $Res Function(CartItemDto) _then;

  @override
  $Res call({
    Object? productId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_CartItemDtoCopyWith<$Res>
    implements $CartItemDtoCopyWith<$Res> {
  factory _$$_CartItemDtoCopyWith(
          _$_CartItemDto value, $Res Function(_$_CartItemDto) then) =
      __$$_CartItemDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String productId,
      String name,
      String imageUrl,
      int price,
      int quantity});
}

/// @nodoc
class __$$_CartItemDtoCopyWithImpl<$Res> extends _$CartItemDtoCopyWithImpl<$Res>
    implements _$$_CartItemDtoCopyWith<$Res> {
  __$$_CartItemDtoCopyWithImpl(
      _$_CartItemDto _value, $Res Function(_$_CartItemDto) _then)
      : super(_value, (v) => _then(v as _$_CartItemDto));

  @override
  _$_CartItemDto get _value => super._value as _$_CartItemDto;

  @override
  $Res call({
    Object? productId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_CartItemDto(
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartItemDto extends _CartItemDto {
  const _$_CartItemDto(
      {required this.productId,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.quantity})
      : super._();

  factory _$_CartItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_CartItemDtoFromJson(json);

  @override
  final String productId;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final int price;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartItemDto(productId: $productId, name: $name, imageUrl: $imageUrl, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartItemDto &&
            const DeepCollectionEquality().equals(other.productId, productId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(productId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$_CartItemDtoCopyWith<_$_CartItemDto> get copyWith =>
      __$$_CartItemDtoCopyWithImpl<_$_CartItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartItemDtoToJson(
      this,
    );
  }
}

abstract class _CartItemDto extends CartItemDto {
  const factory _CartItemDto(
      {required final String productId,
      required final String name,
      required final String imageUrl,
      required final int price,
      required final int quantity}) = _$_CartItemDto;
  const _CartItemDto._() : super._();

  factory _CartItemDto.fromJson(Map<String, dynamic> json) =
      _$_CartItemDto.fromJson;

  @override
  String get productId;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  int get price;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_CartItemDtoCopyWith<_$_CartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

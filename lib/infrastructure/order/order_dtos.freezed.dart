// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDtos _$OrderDtosFromJson(Map<String, dynamic> json) {
  return _OrderDtos.fromJson(json);
}

/// @nodoc
mixin _$OrderDtos {
  String get orderId => throw _privateConstructorUsedError;
  String get paymentId => throw _privateConstructorUsedError;
  String get orderedOn => throw _privateConstructorUsedError;
  String get cartId => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDtosCopyWith<OrderDtos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDtosCopyWith<$Res> {
  factory $OrderDtosCopyWith(OrderDtos value, $Res Function(OrderDtos) then) =
      _$OrderDtosCopyWithImpl<$Res>;
  $Res call(
      {String orderId,
      String paymentId,
      String orderedOn,
      String cartId,
      @ServerTimestampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class _$OrderDtosCopyWithImpl<$Res> implements $OrderDtosCopyWith<$Res> {
  _$OrderDtosCopyWithImpl(this._value, this._then);

  final OrderDtos _value;
  // ignore: unused_field
  final $Res Function(OrderDtos) _then;

  @override
  $Res call({
    Object? orderId = freezed,
    Object? paymentId = freezed,
    Object? orderedOn = freezed,
    Object? cartId = freezed,
    Object? serverTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentId: paymentId == freezed
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      orderedOn: orderedOn == freezed
          ? _value.orderedOn
          : orderedOn // ignore: cast_nullable_to_non_nullable
              as String,
      cartId: cartId == freezed
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderDtosCopyWith<$Res> implements $OrderDtosCopyWith<$Res> {
  factory _$$_OrderDtosCopyWith(
          _$_OrderDtos value, $Res Function(_$_OrderDtos) then) =
      __$$_OrderDtosCopyWithImpl<$Res>;
  @override
  $Res call(
      {String orderId,
      String paymentId,
      String orderedOn,
      String cartId,
      @ServerTimestampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class __$$_OrderDtosCopyWithImpl<$Res> extends _$OrderDtosCopyWithImpl<$Res>
    implements _$$_OrderDtosCopyWith<$Res> {
  __$$_OrderDtosCopyWithImpl(
      _$_OrderDtos _value, $Res Function(_$_OrderDtos) _then)
      : super(_value, (v) => _then(v as _$_OrderDtos));

  @override
  _$_OrderDtos get _value => super._value as _$_OrderDtos;

  @override
  $Res call({
    Object? orderId = freezed,
    Object? paymentId = freezed,
    Object? orderedOn = freezed,
    Object? cartId = freezed,
    Object? serverTimeStamp = freezed,
  }) {
    return _then(_$_OrderDtos(
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentId: paymentId == freezed
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      orderedOn: orderedOn == freezed
          ? _value.orderedOn
          : orderedOn // ignore: cast_nullable_to_non_nullable
              as String,
      cartId: cartId == freezed
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
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
class _$_OrderDtos extends _OrderDtos {
  const _$_OrderDtos(
      {required this.orderId,
      required this.paymentId,
      required this.orderedOn,
      required this.cartId,
      @ServerTimestampConverter() required this.serverTimeStamp})
      : super._();

  factory _$_OrderDtos.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDtosFromJson(json);

  @override
  final String orderId;
  @override
  final String paymentId;
  @override
  final String orderedOn;
  @override
  final String cartId;
  @override
  @ServerTimestampConverter()
  final FieldValue serverTimeStamp;

  @override
  String toString() {
    return 'OrderDtos(orderId: $orderId, paymentId: $paymentId, orderedOn: $orderedOn, cartId: $cartId, serverTimeStamp: $serverTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDtos &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality().equals(other.paymentId, paymentId) &&
            const DeepCollectionEquality().equals(other.orderedOn, orderedOn) &&
            const DeepCollectionEquality().equals(other.cartId, cartId) &&
            const DeepCollectionEquality()
                .equals(other.serverTimeStamp, serverTimeStamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderId),
      const DeepCollectionEquality().hash(paymentId),
      const DeepCollectionEquality().hash(orderedOn),
      const DeepCollectionEquality().hash(cartId),
      const DeepCollectionEquality().hash(serverTimeStamp));

  @JsonKey(ignore: true)
  @override
  _$$_OrderDtosCopyWith<_$_OrderDtos> get copyWith =>
      __$$_OrderDtosCopyWithImpl<_$_OrderDtos>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDtosToJson(
      this,
    );
  }
}

abstract class _OrderDtos extends OrderDtos {
  const factory _OrderDtos(
      {required final String orderId,
      required final String paymentId,
      required final String orderedOn,
      required final String cartId,
      @ServerTimestampConverter()
          required final FieldValue serverTimeStamp}) = _$_OrderDtos;
  const _OrderDtos._() : super._();

  factory _OrderDtos.fromJson(Map<String, dynamic> json) =
      _$_OrderDtos.fromJson;

  @override
  String get orderId;
  @override
  String get paymentId;
  @override
  String get orderedOn;
  @override
  String get cartId;
  @override
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDtosCopyWith<_$_OrderDtos> get copyWith =>
      throw _privateConstructorUsedError;
}

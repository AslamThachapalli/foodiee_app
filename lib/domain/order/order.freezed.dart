// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Order {
  OrderId get orderId => throw _privateConstructorUsedError;
  PaymentId get paymentId => throw _privateConstructorUsedError;
  OrderedOn get orderedOn => throw _privateConstructorUsedError;
  CartId get cartId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
  $Res call(
      {OrderId orderId,
      PaymentId paymentId,
      OrderedOn orderedOn,
      CartId cartId});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  final Order _value;
  // ignore: unused_field
  final $Res Function(Order) _then;

  @override
  $Res call({
    Object? orderId = freezed,
    Object? paymentId = freezed,
    Object? orderedOn = freezed,
    Object? cartId = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as OrderId,
      paymentId: paymentId == freezed
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId,
      orderedOn: orderedOn == freezed
          ? _value.orderedOn
          : orderedOn // ignore: cast_nullable_to_non_nullable
              as OrderedOn,
      cartId: cartId == freezed
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as CartId,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {OrderId orderId,
      PaymentId paymentId,
      OrderedOn orderedOn,
      CartId cartId});
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, (v) => _then(v as _$_Order));

  @override
  _$_Order get _value => super._value as _$_Order;

  @override
  $Res call({
    Object? orderId = freezed,
    Object? paymentId = freezed,
    Object? orderedOn = freezed,
    Object? cartId = freezed,
  }) {
    return _then(_$_Order(
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as OrderId,
      paymentId: paymentId == freezed
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId,
      orderedOn: orderedOn == freezed
          ? _value.orderedOn
          : orderedOn // ignore: cast_nullable_to_non_nullable
              as OrderedOn,
      cartId: cartId == freezed
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as CartId,
    ));
  }
}

/// @nodoc

class _$_Order implements _Order {
  const _$_Order(
      {required this.orderId,
      required this.paymentId,
      required this.orderedOn,
      required this.cartId});

  @override
  final OrderId orderId;
  @override
  final PaymentId paymentId;
  @override
  final OrderedOn orderedOn;
  @override
  final CartId cartId;

  @override
  String toString() {
    return 'Order(orderId: $orderId, paymentId: $paymentId, orderedOn: $orderedOn, cartId: $cartId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality().equals(other.paymentId, paymentId) &&
            const DeepCollectionEquality().equals(other.orderedOn, orderedOn) &&
            const DeepCollectionEquality().equals(other.cartId, cartId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderId),
      const DeepCollectionEquality().hash(paymentId),
      const DeepCollectionEquality().hash(orderedOn),
      const DeepCollectionEquality().hash(cartId));

  @JsonKey(ignore: true)
  @override
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);
}

abstract class _Order implements Order {
  const factory _Order(
      {required final OrderId orderId,
      required final PaymentId paymentId,
      required final OrderedOn orderedOn,
      required final CartId cartId}) = _$_Order;

  @override
  OrderId get orderId;
  @override
  PaymentId get paymentId;
  @override
  OrderedOn get orderedOn;
  @override
  CartId get cartId;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}

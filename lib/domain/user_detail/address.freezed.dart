// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Address {
  AddressModel get home => throw _privateConstructorUsedError;
  AddressModel get work => throw _privateConstructorUsedError;
  AddressModel get currentLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res>;
  $Res call(
      {AddressModel home, AddressModel work, AddressModel currentLocation});

  $AddressModelCopyWith<$Res> get home;
  $AddressModelCopyWith<$Res> get work;
  $AddressModelCopyWith<$Res> get currentLocation;
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  final Address _value;
  // ignore: unused_field
  final $Res Function(Address) _then;

  @override
  $Res call({
    Object? home = freezed,
    Object? work = freezed,
    Object? currentLocation = freezed,
  }) {
    return _then(_value.copyWith(
      home: home == freezed
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      work: work == freezed
          ? _value.work
          : work // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      currentLocation: currentLocation == freezed
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ));
  }

  @override
  $AddressModelCopyWith<$Res> get home {
    return $AddressModelCopyWith<$Res>(_value.home, (value) {
      return _then(_value.copyWith(home: value));
    });
  }

  @override
  $AddressModelCopyWith<$Res> get work {
    return $AddressModelCopyWith<$Res>(_value.work, (value) {
      return _then(_value.copyWith(work: value));
    });
  }

  @override
  $AddressModelCopyWith<$Res> get currentLocation {
    return $AddressModelCopyWith<$Res>(_value.currentLocation, (value) {
      return _then(_value.copyWith(currentLocation: value));
    });
  }
}

/// @nodoc
abstract class _$$_AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$_AddressCopyWith(
          _$_Address value, $Res Function(_$_Address) then) =
      __$$_AddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {AddressModel home, AddressModel work, AddressModel currentLocation});

  @override
  $AddressModelCopyWith<$Res> get home;
  @override
  $AddressModelCopyWith<$Res> get work;
  @override
  $AddressModelCopyWith<$Res> get currentLocation;
}

/// @nodoc
class __$$_AddressCopyWithImpl<$Res> extends _$AddressCopyWithImpl<$Res>
    implements _$$_AddressCopyWith<$Res> {
  __$$_AddressCopyWithImpl(_$_Address _value, $Res Function(_$_Address) _then)
      : super(_value, (v) => _then(v as _$_Address));

  @override
  _$_Address get _value => super._value as _$_Address;

  @override
  $Res call({
    Object? home = freezed,
    Object? work = freezed,
    Object? currentLocation = freezed,
  }) {
    return _then(_$_Address(
      home: home == freezed
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      work: work == freezed
          ? _value.work
          : work // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      currentLocation: currentLocation == freezed
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ));
  }
}

/// @nodoc

class _$_Address implements _Address {
  const _$_Address(
      {required this.home, required this.work, required this.currentLocation});

  @override
  final AddressModel home;
  @override
  final AddressModel work;
  @override
  final AddressModel currentLocation;

  @override
  String toString() {
    return 'Address(home: $home, work: $work, currentLocation: $currentLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Address &&
            const DeepCollectionEquality().equals(other.home, home) &&
            const DeepCollectionEquality().equals(other.work, work) &&
            const DeepCollectionEquality()
                .equals(other.currentLocation, currentLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(home),
      const DeepCollectionEquality().hash(work),
      const DeepCollectionEquality().hash(currentLocation));

  @JsonKey(ignore: true)
  @override
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      __$$_AddressCopyWithImpl<_$_Address>(this, _$identity);
}

abstract class _Address implements Address {
  const factory _Address(
      {required final AddressModel home,
      required final AddressModel work,
      required final AddressModel currentLocation}) = _$_Address;

  @override
  AddressModel get home;
  @override
  AddressModel get work;
  @override
  AddressModel get currentLocation;
  @override
  @JsonKey(ignore: true)
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'logged_in_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoggedInUser {
  UserName get userName => throw _privateConstructorUsedError;
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoggedInUserCopyWith<LoggedInUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedInUserCopyWith<$Res> {
  factory $LoggedInUserCopyWith(
          LoggedInUser value, $Res Function(LoggedInUser) then) =
      _$LoggedInUserCopyWithImpl<$Res>;
  $Res call(
      {UserName userName,
      EmailAddress emailAddress,
      PhoneNumber phoneNumber,
      Address? address});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$LoggedInUserCopyWithImpl<$Res> implements $LoggedInUserCopyWith<$Res> {
  _$LoggedInUserCopyWithImpl(this._value, this._then);

  final LoggedInUser _value;
  // ignore: unused_field
  final $Res Function(LoggedInUser) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? emailAddress = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as UserName,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
    ));
  }

  @override
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc
abstract class _$$_LoggedInUserCopyWith<$Res>
    implements $LoggedInUserCopyWith<$Res> {
  factory _$$_LoggedInUserCopyWith(
          _$_LoggedInUser value, $Res Function(_$_LoggedInUser) then) =
      __$$_LoggedInUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserName userName,
      EmailAddress emailAddress,
      PhoneNumber phoneNumber,
      Address? address});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_LoggedInUserCopyWithImpl<$Res>
    extends _$LoggedInUserCopyWithImpl<$Res>
    implements _$$_LoggedInUserCopyWith<$Res> {
  __$$_LoggedInUserCopyWithImpl(
      _$_LoggedInUser _value, $Res Function(_$_LoggedInUser) _then)
      : super(_value, (v) => _then(v as _$_LoggedInUser));

  @override
  _$_LoggedInUser get _value => super._value as _$_LoggedInUser;

  @override
  $Res call({
    Object? userName = freezed,
    Object? emailAddress = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_LoggedInUser(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as UserName,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
    ));
  }
}

/// @nodoc

class _$_LoggedInUser implements _LoggedInUser {
  const _$_LoggedInUser(
      {required this.userName,
      required this.emailAddress,
      required this.phoneNumber,
      this.address});

  @override
  final UserName userName;
  @override
  final EmailAddress emailAddress;
  @override
  final PhoneNumber phoneNumber;
  @override
  final Address? address;

  @override
  String toString() {
    return 'LoggedInUser(userName: $userName, emailAddress: $emailAddress, phoneNumber: $phoneNumber, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoggedInUser &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$$_LoggedInUserCopyWith<_$_LoggedInUser> get copyWith =>
      __$$_LoggedInUserCopyWithImpl<_$_LoggedInUser>(this, _$identity);
}

abstract class _LoggedInUser implements LoggedInUser {
  const factory _LoggedInUser(
      {required final UserName userName,
      required final EmailAddress emailAddress,
      required final PhoneNumber phoneNumber,
      final Address? address}) = _$_LoggedInUser;

  @override
  UserName get userName;
  @override
  EmailAddress get emailAddress;
  @override
  PhoneNumber get phoneNumber;
  @override
  Address? get address;
  @override
  @JsonKey(ignore: true)
  _$$_LoggedInUserCopyWith<_$_LoggedInUser> get copyWith =>
      throw _privateConstructorUsedError;
}

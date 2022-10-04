// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'logged_in_user_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoggedInUserDto _$LoggedInUserDtoFromJson(Map<String, dynamic> json) {
  return _LoggedInUserDto.fromJson(json);
}

/// @nodoc
mixin _$LoggedInUserDto {
  String? get userName => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;
  int? get phoneNumber => throw _privateConstructorUsedError;
  AddressDto get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoggedInUserDtoCopyWith<LoggedInUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedInUserDtoCopyWith<$Res> {
  factory $LoggedInUserDtoCopyWith(
          LoggedInUserDto value, $Res Function(LoggedInUserDto) then) =
      _$LoggedInUserDtoCopyWithImpl<$Res>;
  $Res call(
      {String? userName,
      String emailAddress,
      int? phoneNumber,
      AddressDto address});

  $AddressDtoCopyWith<$Res> get address;
}

/// @nodoc
class _$LoggedInUserDtoCopyWithImpl<$Res>
    implements $LoggedInUserDtoCopyWith<$Res> {
  _$LoggedInUserDtoCopyWithImpl(this._value, this._then);

  final LoggedInUserDto _value;
  // ignore: unused_field
  final $Res Function(LoggedInUserDto) _then;

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
              as String?,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressDto,
    ));
  }

  @override
  $AddressDtoCopyWith<$Res> get address {
    return $AddressDtoCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc
abstract class _$$_LoggedInUserDtoCopyWith<$Res>
    implements $LoggedInUserDtoCopyWith<$Res> {
  factory _$$_LoggedInUserDtoCopyWith(
          _$_LoggedInUserDto value, $Res Function(_$_LoggedInUserDto) then) =
      __$$_LoggedInUserDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? userName,
      String emailAddress,
      int? phoneNumber,
      AddressDto address});

  @override
  $AddressDtoCopyWith<$Res> get address;
}

/// @nodoc
class __$$_LoggedInUserDtoCopyWithImpl<$Res>
    extends _$LoggedInUserDtoCopyWithImpl<$Res>
    implements _$$_LoggedInUserDtoCopyWith<$Res> {
  __$$_LoggedInUserDtoCopyWithImpl(
      _$_LoggedInUserDto _value, $Res Function(_$_LoggedInUserDto) _then)
      : super(_value, (v) => _then(v as _$_LoggedInUserDto));

  @override
  _$_LoggedInUserDto get _value => super._value as _$_LoggedInUserDto;

  @override
  $Res call({
    Object? userName = freezed,
    Object? emailAddress = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_LoggedInUserDto(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressDto,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_LoggedInUserDto extends _LoggedInUserDto {
  const _$_LoggedInUserDto(
      {required this.userName,
      required this.emailAddress,
      required this.phoneNumber,
      required this.address})
      : super._();

  factory _$_LoggedInUserDto.fromJson(Map<String, dynamic> json) =>
      _$$_LoggedInUserDtoFromJson(json);

  @override
  final String? userName;
  @override
  final String emailAddress;
  @override
  final int? phoneNumber;
  @override
  final AddressDto address;

  @override
  String toString() {
    return 'LoggedInUserDto(userName: $userName, emailAddress: $emailAddress, phoneNumber: $phoneNumber, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoggedInUserDto &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$$_LoggedInUserDtoCopyWith<_$_LoggedInUserDto> get copyWith =>
      __$$_LoggedInUserDtoCopyWithImpl<_$_LoggedInUserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoggedInUserDtoToJson(
      this,
    );
  }
}

abstract class _LoggedInUserDto extends LoggedInUserDto {
  const factory _LoggedInUserDto(
      {required final String? userName,
      required final String emailAddress,
      required final int? phoneNumber,
      required final AddressDto address}) = _$_LoggedInUserDto;
  const _LoggedInUserDto._() : super._();

  factory _LoggedInUserDto.fromJson(Map<String, dynamic> json) =
      _$_LoggedInUserDto.fromJson;

  @override
  String? get userName;
  @override
  String get emailAddress;
  @override
  int? get phoneNumber;
  @override
  AddressDto get address;
  @override
  @JsonKey(ignore: true)
  _$$_LoggedInUserDtoCopyWith<_$_LoggedInUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) {
  return _AddressDto.fromJson(json);
}

/// @nodoc
mixin _$AddressDto {
  AddressModelDto get home => throw _privateConstructorUsedError;
  AddressModelDto get work => throw _privateConstructorUsedError;
  AddressModelDto get currentLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressDtoCopyWith<AddressDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDtoCopyWith<$Res> {
  factory $AddressDtoCopyWith(
          AddressDto value, $Res Function(AddressDto) then) =
      _$AddressDtoCopyWithImpl<$Res>;
  $Res call(
      {AddressModelDto home,
      AddressModelDto work,
      AddressModelDto currentLocation});

  $AddressModelDtoCopyWith<$Res> get home;
  $AddressModelDtoCopyWith<$Res> get work;
  $AddressModelDtoCopyWith<$Res> get currentLocation;
}

/// @nodoc
class _$AddressDtoCopyWithImpl<$Res> implements $AddressDtoCopyWith<$Res> {
  _$AddressDtoCopyWithImpl(this._value, this._then);

  final AddressDto _value;
  // ignore: unused_field
  final $Res Function(AddressDto) _then;

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
              as AddressModelDto,
      work: work == freezed
          ? _value.work
          : work // ignore: cast_nullable_to_non_nullable
              as AddressModelDto,
      currentLocation: currentLocation == freezed
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as AddressModelDto,
    ));
  }

  @override
  $AddressModelDtoCopyWith<$Res> get home {
    return $AddressModelDtoCopyWith<$Res>(_value.home, (value) {
      return _then(_value.copyWith(home: value));
    });
  }

  @override
  $AddressModelDtoCopyWith<$Res> get work {
    return $AddressModelDtoCopyWith<$Res>(_value.work, (value) {
      return _then(_value.copyWith(work: value));
    });
  }

  @override
  $AddressModelDtoCopyWith<$Res> get currentLocation {
    return $AddressModelDtoCopyWith<$Res>(_value.currentLocation, (value) {
      return _then(_value.copyWith(currentLocation: value));
    });
  }
}

/// @nodoc
abstract class _$$_AddressDtoCopyWith<$Res>
    implements $AddressDtoCopyWith<$Res> {
  factory _$$_AddressDtoCopyWith(
          _$_AddressDto value, $Res Function(_$_AddressDto) then) =
      __$$_AddressDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {AddressModelDto home,
      AddressModelDto work,
      AddressModelDto currentLocation});

  @override
  $AddressModelDtoCopyWith<$Res> get home;
  @override
  $AddressModelDtoCopyWith<$Res> get work;
  @override
  $AddressModelDtoCopyWith<$Res> get currentLocation;
}

/// @nodoc
class __$$_AddressDtoCopyWithImpl<$Res> extends _$AddressDtoCopyWithImpl<$Res>
    implements _$$_AddressDtoCopyWith<$Res> {
  __$$_AddressDtoCopyWithImpl(
      _$_AddressDto _value, $Res Function(_$_AddressDto) _then)
      : super(_value, (v) => _then(v as _$_AddressDto));

  @override
  _$_AddressDto get _value => super._value as _$_AddressDto;

  @override
  $Res call({
    Object? home = freezed,
    Object? work = freezed,
    Object? currentLocation = freezed,
  }) {
    return _then(_$_AddressDto(
      home: home == freezed
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as AddressModelDto,
      work: work == freezed
          ? _value.work
          : work // ignore: cast_nullable_to_non_nullable
              as AddressModelDto,
      currentLocation: currentLocation == freezed
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as AddressModelDto,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AddressDto extends _AddressDto {
  const _$_AddressDto(
      {required this.home, required this.work, required this.currentLocation})
      : super._();

  factory _$_AddressDto.fromJson(Map<String, dynamic> json) =>
      _$$_AddressDtoFromJson(json);

  @override
  final AddressModelDto home;
  @override
  final AddressModelDto work;
  @override
  final AddressModelDto currentLocation;

  @override
  String toString() {
    return 'AddressDto(home: $home, work: $work, currentLocation: $currentLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressDto &&
            const DeepCollectionEquality().equals(other.home, home) &&
            const DeepCollectionEquality().equals(other.work, work) &&
            const DeepCollectionEquality()
                .equals(other.currentLocation, currentLocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(home),
      const DeepCollectionEquality().hash(work),
      const DeepCollectionEquality().hash(currentLocation));

  @JsonKey(ignore: true)
  @override
  _$$_AddressDtoCopyWith<_$_AddressDto> get copyWith =>
      __$$_AddressDtoCopyWithImpl<_$_AddressDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressDtoToJson(
      this,
    );
  }
}

abstract class _AddressDto extends AddressDto {
  const factory _AddressDto(
      {required final AddressModelDto home,
      required final AddressModelDto work,
      required final AddressModelDto currentLocation}) = _$_AddressDto;
  const _AddressDto._() : super._();

  factory _AddressDto.fromJson(Map<String, dynamic> json) =
      _$_AddressDto.fromJson;

  @override
  AddressModelDto get home;
  @override
  AddressModelDto get work;
  @override
  AddressModelDto get currentLocation;
  @override
  @JsonKey(ignore: true)
  _$$_AddressDtoCopyWith<_$_AddressDto> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressModelDto _$AddressModelDtoFromJson(Map<String, dynamic> json) {
  return _AddressModelDto.fromJson(json);
}

/// @nodoc
mixin _$AddressModelDto {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelDtoCopyWith<AddressModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelDtoCopyWith<$Res> {
  factory $AddressModelDtoCopyWith(
          AddressModelDto value, $Res Function(AddressModelDto) then) =
      _$AddressModelDtoCopyWithImpl<$Res>;
  $Res call({double? latitude, double? longitude, String? location});
}

/// @nodoc
class _$AddressModelDtoCopyWithImpl<$Res>
    implements $AddressModelDtoCopyWith<$Res> {
  _$AddressModelDtoCopyWithImpl(this._value, this._then);

  final AddressModelDto _value;
  // ignore: unused_field
  final $Res Function(AddressModelDto) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AddressModelDtoCopyWith<$Res>
    implements $AddressModelDtoCopyWith<$Res> {
  factory _$$_AddressModelDtoCopyWith(
          _$_AddressModelDto value, $Res Function(_$_AddressModelDto) then) =
      __$$_AddressModelDtoCopyWithImpl<$Res>;
  @override
  $Res call({double? latitude, double? longitude, String? location});
}

/// @nodoc
class __$$_AddressModelDtoCopyWithImpl<$Res>
    extends _$AddressModelDtoCopyWithImpl<$Res>
    implements _$$_AddressModelDtoCopyWith<$Res> {
  __$$_AddressModelDtoCopyWithImpl(
      _$_AddressModelDto _value, $Res Function(_$_AddressModelDto) _then)
      : super(_value, (v) => _then(v as _$_AddressModelDto));

  @override
  _$_AddressModelDto get _value => super._value as _$_AddressModelDto;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_AddressModelDto(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressModelDto extends _AddressModelDto {
  const _$_AddressModelDto(
      {required this.latitude, required this.longitude, required this.location})
      : super._();

  factory _$_AddressModelDto.fromJson(Map<String, dynamic> json) =>
      _$$_AddressModelDtoFromJson(json);

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? location;

  @override
  String toString() {
    return 'AddressModelDto(latitude: $latitude, longitude: $longitude, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressModelDto &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$$_AddressModelDtoCopyWith<_$_AddressModelDto> get copyWith =>
      __$$_AddressModelDtoCopyWithImpl<_$_AddressModelDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressModelDtoToJson(
      this,
    );
  }
}

abstract class _AddressModelDto extends AddressModelDto {
  const factory _AddressModelDto(
      {required final double? latitude,
      required final double? longitude,
      required final String? location}) = _$_AddressModelDto;
  const _AddressModelDto._() : super._();

  factory _AddressModelDto.fromJson(Map<String, dynamic> json) =
      _$_AddressModelDto.fromJson;

  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get location;
  @override
  @JsonKey(ignore: true)
  _$$_AddressModelDtoCopyWith<_$_AddressModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_user_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoggedInUserDto _$$_LoggedInUserDtoFromJson(Map<String, dynamic> json) =>
    _$_LoggedInUserDto(
      userName: json['userName'] as String?,
      emailAddress: json['emailAddress'] as String,
      phoneNumber: json['phoneNumber'] as int?,
      address: AddressDto.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LoggedInUserDtoToJson(_$_LoggedInUserDto instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address.toJson(),
    };

_$_AddressDto _$$_AddressDtoFromJson(Map<String, dynamic> json) =>
    _$_AddressDto(
      home: AddressModelDto.fromJson(json['home'] as Map<String, dynamic>),
      work: AddressModelDto.fromJson(json['work'] as Map<String, dynamic>),
      currentLocation: AddressModelDto.fromJson(
          json['currentLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AddressDtoToJson(_$_AddressDto instance) =>
    <String, dynamic>{
      'home': instance.home.toJson(),
      'work': instance.work.toJson(),
      'currentLocation': instance.currentLocation.toJson(),
    };

_$_AddressModelDto _$$_AddressModelDtoFromJson(Map<String, dynamic> json) =>
    _$_AddressModelDto(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$_AddressModelDtoToJson(_$_AddressModelDto instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'location': instance.location,
    };

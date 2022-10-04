import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth/value_objects.dart';
import '../../domain/user_detail/address.dart';
import '../../domain/user_detail/logged_in_user.dart';
import '../../domain/location/address_model.dart';
import '../../domain/location/value_objects.dart';

part 'logged_in_user_dtos.freezed.dart';
part 'logged_in_user_dtos.g.dart';

@freezed
class LoggedInUserDto with _$LoggedInUserDto {
  const LoggedInUserDto._();

  @JsonSerializable(explicitToJson: true)
  const factory LoggedInUserDto({
    required String? userName,
    required String emailAddress,
    required int? phoneNumber,
    required AddressDto address,
  }) = _LoggedInUserDto;

  factory LoggedInUserDto.fromDomain(LoggedInUser loggedInUser) {
    return LoggedInUserDto(
      userName: loggedInUser.userName.getOrCrash(),
      emailAddress: loggedInUser.emailAddress.getOrCrash(),
      phoneNumber: loggedInUser.phoneNumber.getOrCrash(),
      address: loggedInUser.address != null
          ? AddressDto.fromDomain(loggedInUser.address!)
          : AddressDto.fromDomain(Address.empty()),
    );
  }

  LoggedInUser toDomain() {
    return LoggedInUser(
      userName: UserName(userName),
      emailAddress: EmailAddress(emailAddress),
      phoneNumber: PhoneNumber(phoneNumber),
      address: address.toDomain(),
    );
  }

  factory LoggedInUserDto.fromJson(Map<String, dynamic> json) => _$LoggedInUserDtoFromJson(json);
}

@freezed
class AddressDto with _$AddressDto {
  const AddressDto._();

  @JsonSerializable(explicitToJson: true)
  const factory AddressDto({
    required AddressModelDto home,
    required AddressModelDto work,
    required AddressModelDto currentLocation,
  }) = _AddressDto;

  factory AddressDto.fromDomain(Address address) {
    return AddressDto(
      home: AddressModelDto.fromDomain(address.home),
      work: AddressModelDto.fromDomain(address.work),
      currentLocation: AddressModelDto.fromDomain(address.currentLocation),
    );
  }

  Address toDomain() {
    return Address(
      home: home.toDomain(),
      work: work.toDomain(),
      currentLocation: currentLocation.toDomain(),
    );
  }

  factory AddressDto.fromJson(Map<String, dynamic> json) => _$AddressDtoFromJson(json);
}

@freezed
class AddressModelDto with _$AddressModelDto {
  const AddressModelDto._();

  const factory AddressModelDto({
    required double? latitude,
    required double? longitude,
    required String? location,
  }) = _AddressModelDto;

  factory AddressModelDto.fromDomain(AddressModel addressModel) {
    return AddressModelDto(
      latitude: addressModel.latitude?.getOrCrash(),
      longitude: addressModel.longitude?.getOrCrash(),
      location: addressModel.location?.getOrCrash(),
    );
  }

  AddressModel toDomain() {
    return AddressModel(
      latitude: Latitude(latitude),
      longitude: Longitude(longitude),
      location: Location(location),
    );
  }

  factory AddressModelDto.fromJson(Map<String, dynamic> json) => _$AddressModelDtoFromJson(json);
}

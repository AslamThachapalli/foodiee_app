import 'package:freezed_annotation/freezed_annotation.dart';

import '../location/address_model.dart';

part 'address.freezed.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required AddressModel home,
    required AddressModel work,
    required AddressModel currentLocation,
  }) = _Address;

  factory Address.empty() => Address(
        home: AddressModel.empty(),
        work: AddressModel.empty(),
        currentLocation: AddressModel.empty(),
      );
}

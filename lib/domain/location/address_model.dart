import 'package:freezed_annotation/freezed_annotation.dart';

import './value_objects.dart';

part 'address_model.freezed.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required Latitude? latitude,
    required Longitude? longitude,
    required Location? location,
  }) = _AddressModel;

  factory AddressModel.empty() => AddressModel(
        latitude: Latitude(null),
        longitude: Longitude(null),
        location: Location(null),
      );
}

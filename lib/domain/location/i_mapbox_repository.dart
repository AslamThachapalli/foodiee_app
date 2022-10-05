import 'package:dartz/dartz.dart';
import 'package:location/location.dart';

abstract class IMapboxRepository {
  Future<String> getLocationAddress({required double latitude, required double longitude});
  String getLocationPreviewImage({required double latitude, required double longitude});
  Future<Option<LocationData>> getLocation();
}

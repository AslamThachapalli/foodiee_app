import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

import '../../domain/location/i_mapbox_repository.dart';

const MAPBOX_API_KEY =
    'pk.eyJ1Ijoia25vd2FzbGFtdHMiLCJhIjoiY2w4dHZpZDMyMGI3aTN1bW5ydnBqcDFkeCJ9.ToIUkDmXTw7BTbhwAy_87Q';

@LazySingleton(as: IMapboxRepository)
class MapboxRepository implements IMapboxRepository {
  @override
  Future<String> getLocationAddress({
    required double latitude,
    required double longitude,
  }) async {
    Uri url = Uri.parse(
        'https://api.mapbox.com/geocoding/v5/mapbox.places/$longitude,$latitude.json?access_token=$MAPBOX_API_KEY');
    final response = await http.get(url);
    print(response.body);
    return json.decode(response.body)['features'][0]['place_name'];
  }

  @override
  String getLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-l($longitude,$latitude)/$longitude,$latitude,15.25,0,0/600x300?access_token=$MAPBOX_API_KEY';
  }

  @override
  Future<Option<LocationData>> getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return none();
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return none();
      }
    }

    locationData = await location.getLocation();
    return some(locationData);
  }
}

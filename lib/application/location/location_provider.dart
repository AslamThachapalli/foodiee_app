import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';

import '../../domain/core/firestore_failures.dart';
import '../../domain/user_detail/address.dart';
import '../../domain/location/address_model.dart';
import '../../domain/location/i_mapbox_repository.dart';
import '../../domain/location/i_save_location_repo.dart';
import '../../domain/location/value_objects.dart' as value_objects;

@injectable
class LocationProvider with ChangeNotifier {
  final IMapboxRepository _mapboxRepository;
  final ISaveLocationRepo _saveLocationRepo;
  LocationProvider(this._saveLocationRepo, this._mapboxRepository);

  Address _address = Address.empty();
  Map<String, AddressModel> _addressMap = {};
  int _index = 0;
  LocationData? _locationData;
  Map<String, String?> _previewImageUrl = {};
  String? _onMapDisplay;
  LatLng? _pickedLocation;

  Address get address => _address;
  Map<String, AddressModel> get addressMap => _addressMap;
  int get index => _index;
  LocationData? get locationData => _locationData;
  Map<String, String?> get previewImageUrl => _previewImageUrl;
  String? get onMapDisplay => _onMapDisplay;
  LatLng? get pickedLocation => _pickedLocation;

  //This method is called during initialization
  Future<void> getLocationCoordinates() async {
    final locationDataOption = await _mapboxRepository.getLocation();
    locationDataOption.fold(
      () {
        _locationData = null;
      },
      (locationData) {
        _locationData = locationData;
      },
    );
    notifyListeners();
  }

  //gets the preview image url if any already available.
  //Called in initState.
  void getPreviewImage({
    required Map<String, AddressModel> addressMap,
  }) {
    addressMap.forEach((key, value) {
      if (value.longitude?.getOrCrash() == null || value.latitude?.getOrCrash() == null) {
        return;
      }
      _previewImageUrl[key] = _mapboxRepository.getLocationPreviewImage(
        latitude: value.latitude!.getOrCrash()!,
        longitude: value.longitude!.getOrCrash()!,
      );
    });
    // notifyListeners();
  }

  //Used to toggle between address types.
  void locationTypeSelected(int index) {
    _index = index;
    notifyListeners();
  }

  //Below three methods are called when SaveAddress button pressed

  void updateAddress({
    required Map<String, AddressModel> addressMap,
  }) {
    _address = Address(
      home: addressMap['home']!,
      work: addressMap['work']!,
      currentLocation: addressMap['currentLocation']!,
    );
    notifyListeners();
  }

  Future<Either<FirestoreFailure, Unit>?> saveLocationPressed({
    required String key,
    required Address address,
  }) async {
    final saveOption = await _saveLocationRepo.saveAddressToServer(
      key: key,
      address: address,
    );
    saveOption.fold(
      () => null,
      id,
    );
    notifyListeners();
  }

  void updatePreviewImage({
    required String key,
    required AddressModel addressModel,
  }) {
    if (addressModel.latitude?.getOrCrash() == null ||
        addressModel.longitude?.getOrCrash() == null) {
      return;
    }
    String previewUrl = _mapboxRepository.getLocationPreviewImage(
      latitude: addressModel.latitude!.getOrCrash()!,
      longitude: addressModel.longitude!.getOrCrash()!,
    );
    _previewImageUrl[key] = previewUrl;
    notifyListeners();
  }

  //Below three methods are on MapScreen

  Future<void> displayAddressOnMap({
    required double latitude,
    required double longitude,
  }) async {
    _onMapDisplay = await _mapboxRepository.getLocationAddress(
      latitude: latitude,
      longitude: longitude,
    );
    notifyListeners();
  }

  void updatePickedLocation(LatLng pickedLocation) {
    _pickedLocation = pickedLocation;
    notifyListeners();
  }

  //On tapping save button
  void addressPicked({
    required String key,
    required double latitude,
    required double longitude,
    required String placeName,
  }) {
    _addressMap[key] = AddressModel(
      latitude: value_objects.Latitude(latitude),
      longitude: value_objects.Longitude(longitude),
      location: value_objects.Location(placeName),
    );
    notifyListeners();
  }

  //This method is called on ProxyProvider
  update(Address address) {
    _address = address;
    _addressMap = {
      'home': _address.home,
      'work': _address.work,
      'currentLocation': _address.currentLocation,
    };
    notifyListeners();
  }
}

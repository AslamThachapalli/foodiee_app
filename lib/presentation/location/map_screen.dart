import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import 'package:get/get.dart';

import '../../application/location/location_provider.dart';
import '../core/app_icon.dart';
import './widgets/on_map_display_widget.dart';
import './widgets/map_widget.dart';

class MapScreen extends StatelessWidget {
  final String addressKey;
  final LocationData locationData;
  const MapScreen({required this.locationData, required this.addressKey, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //FlutterMap widget
          MapWidget(locationData: locationData),

          //Screen Icons
          Positioned(
            top: 45,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //go back icon
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios_rounded,
                    backgroundColor: Colors.white.withOpacity(0.85),
                  ),
                ),

                //pick address icon
                Consumer<LocationProvider>(
                  builder: (context, locationProvider, _) => GestureDetector(
                    onTap: () {
                      if (locationProvider.pickedLocation == null) {
                        return;
                      }
                      Provider.of<LocationProvider>(context, listen: false).addressPicked(
                          key: addressKey,
                          latitude: locationProvider.pickedLocation!.latitude,
                          longitude: locationProvider.pickedLocation!.longitude,
                          placeName: locationProvider.onMapDisplay!);
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.check,
                      backgroundColor: Colors.white.withOpacity(0.85),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Display picked location widget
          Positioned(
            top: 100,
            right: 20,
            left: 20,
            child: Consumer<LocationProvider>(
              builder: (context, locationProvider, _) => OnMapDisplayWidget(
                text: locationProvider.onMapDisplay ?? 'Pick a Location',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

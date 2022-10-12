import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../application/location/location_provider.dart';
import '../../application/user_detail/user_detail_provider.dart';
import '../../domain/user_detail/logged_in_user.dart';
import '../routes/route_helper.dart';
import '../core/app_icon.dart';
import '../core/no_data_widget.dart';
import './widgets/on_map_display_widget.dart';
import './widgets/map_widget.dart';

class MapScreen extends StatelessWidget {
  final String addressKey;
  final bool isFromCart;
  const MapScreen({
    required this.addressKey,
    required this.isFromCart,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<LocationProvider>(context).locationData == null
          ? const NoDataWidget(
              text: 'Please Turn On Location Service',
              imagePath: 'assets/images/no_location.jpg',
            )
          : Stack(
              children: [
                //FlutterMap widget
                MapWidget(locationData: Provider.of<LocationProvider>(context).locationData!),

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
                      Consumer2<LocationProvider, UserDetailProvider>(
                        builder: (context, locationConsumer, userDetailProvider, _) {
                          final locationProvider =
                              Provider.of<LocationProvider>(context, listen: false);
                          return GestureDetector(
                            onTap: () async {
                              // LoggedInUser? loggedInUser;
                              // if (isFromCart) {
                              //   await Provider.of<UserDetailProvider>(context, listen: false)
                              //       .userDetailRequested();
                              //   loggedInUser = userDetailProvider.loggedInUser;
                              // }
                              if (locationConsumer.pickedLocation == null) {
                                return;
                              }
                              locationProvider.addressPicked(
                                  key: addressKey,
                                  latitude: locationConsumer.pickedLocation!.latitude,
                                  longitude: locationConsumer.pickedLocation!.longitude,
                                  placeName: locationConsumer.onMapDisplay!);
                              if (isFromCart) {
                                await Provider.of<UserDetailProvider>(context, listen: false)
                                    .userDetailRequested();
                                LoggedInUser loggedInUser = userDetailProvider.loggedInUser;

                                Get.toNamed(RouteHelper.getSelectLocationScreen(), arguments: [
                                  loggedInUser.userName.getOrCrash(),
                                  loggedInUser.phoneNumber.getOrCrash(),
                                  false, //isPaying?
                                  true, //isFromCart?
                                ]);
                              } else {
                                Get.back();
                              }
                            },
                            child: AppIcon(
                              icon: Icons.check,
                              backgroundColor: Colors.white.withOpacity(0.85),
                            ),
                          );
                        },
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

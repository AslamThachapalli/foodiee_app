import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/location/location_provider.dart';
import '../../core/app_colors.dart';
import '../../core/dimensions.dart';
import '../../core/small_text.dart';

class BottomNavBarWidget extends StatelessWidget {
  final bool isPaying;
  const BottomNavBarWidget({
    Key? key,
    required this.isPaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context, listen: false);

    return Container(
      height: Dimensions.pixels90,
      padding: EdgeInsets.all(Dimensions.pixels20),
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.pixels20),
          topRight: Radius.circular(Dimensions.pixels20),
        ),
      ),
      child: Center(
        child: Consumer<LocationProvider>(
          builder: (context, locationConsumer, _) {
            int selectedIndex = locationConsumer.index;
            String key = selectedIndex == 0
                ? 'home'
                : selectedIndex == 1
                    ? 'work'
                    : 'currentLocation';
            return GestureDetector(
              onTap: () {
                if (!isPaying) {
                  locationProvider
                    ..updateAddress(
                      addressMap: locationConsumer.addressMap,
                    )
                    ..saveLocationPressed(
                      key: key,
                      address: locationConsumer.address,
                    ).then(
                      (_) => locationProvider.updatePreviewImage(
                        key: key,
                        addressModel: locationConsumer.addressMap[key]!,
                      ),
                    );
                } else {
                  //Todo: Navigate to payment page
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.pixels15, vertical: Dimensions.pixels15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.pixels20),
                  color: AppColors.mainColor,
                ),
                child: SmallText(
                  text: isPaying ? 'Continue' : 'Save Location',
                  color: Colors.white,
                  size: Dimensions.font18,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

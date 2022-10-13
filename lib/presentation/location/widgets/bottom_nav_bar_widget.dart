import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../../application/location/location_provider.dart';
import '../../core/app_colors.dart';
import '../../core/dimensions.dart';
import '../../core/small_text.dart';
import '../../routes/route_helper.dart';

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
            String addressKey = selectedIndex == 0
                ? 'home'
                : selectedIndex == 1
                    ? 'work'
                    : 'currentLocation';
            return GestureDetector(
              onTap: () async {
                if (!isPaying) {
                  locationProvider.updateAddress(
                    addressMap: locationConsumer.addressMap,
                  );
                  await locationProvider.saveLocationPressed(
                    key: addressKey,
                    address: locationConsumer.address,
                  );
                  locationProvider.updatePreviewImage(
                    key: addressKey,
                    addressModel: locationConsumer.addressMap[addressKey]!,
                  );
                } else {
                  if (locationConsumer.addressMap[addressKey]?.location?.getOrCrash() == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please Add An Address'),
                      ),
                    );
                  } else {
                    Get.toNamed(RouteHelper.getOrderSummaryScreen());
                  }
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
                  text: !isPaying
                      ? 'Save Location'
                      : (isPaying &&
                              locationConsumer.addressMap[addressKey]?.location?.getOrCrash() !=
                                  null)
                          ? 'Continue'
                          : 'Select Location',
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

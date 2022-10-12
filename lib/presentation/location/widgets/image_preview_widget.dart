import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../application/location/location_provider.dart';
import '../../core/app_colors.dart';
import '../../core/dimensions.dart';
import '../../routes/route_helper.dart';

class ImagePreviewWidget extends StatelessWidget {
  final LocationProvider locationProvider;
  final String addressKey;
  const ImagePreviewWidget({
    Key? key,
    required this.locationProvider,
    required this.addressKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Provider.of<LocationProvider>(context, listen: false).getLocationCoordinates();
        Get.toNamed(RouteHelper.getMapScreen(), arguments: [
          addressKey,
          false,
        ]);
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: Dimensions.pixels20, vertical: Dimensions.pixels30),
        width: double.maxFinite,
        height: Dimensions.pixels90 * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.pixels5),
          border: Border.all(
            color: AppColors.mainColor,
            width: 2,
          ),
        ),
        child: locationProvider.previewImageUrl[addressKey] != null
            ? Image.network(
                locationProvider.previewImageUrl[addressKey]!,
                fit: BoxFit.cover,
              )
            : const Center(
                child: Text('Select a location'),
              ),
      ),
    );
  }
}

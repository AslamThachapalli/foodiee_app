import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../application/location/location_provider.dart';
import '../../core/app_colors.dart';
import '../../core/dimensions.dart';
import '../../routes/route_helper.dart';

class ImagePreviewWidget extends StatelessWidget {
  final LocationProvider locationProvider;
  const ImagePreviewWidget({
    Key? key,
    required this.locationProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.getMapScreen(), arguments: [
          locationProvider.locationData,
          key,
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
        child: locationProvider.previewImageUrl[key] != null
            ? Image.network(
                locationProvider.previewImageUrl[key]!,
                fit: BoxFit.cover,
              )
            : const Center(
                child: Text('Select a location'),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_colors.dart';
import '../../core/app_icon.dart';
import '../../core/dimensions.dart';
import '../../routes/route_helper.dart';

class CartScreenAppBar extends StatelessWidget {
  const CartScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.pixels45,
      right: Dimensions.pixels20,
      left: Dimensions.pixels20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: AppIcon(
              icon: Icons.arrow_back_ios_rounded,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
            ),
          ),
          SizedBox(width: Dimensions.pixels100),
          GestureDetector(
            onTap: () {
              Get.offAllNamed(RouteHelper.initial);
            },
            child: AppIcon(
              icon: Icons.home_filled,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
            ),
          ),
          AppIcon(
            icon: Icons.shopping_cart_rounded,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

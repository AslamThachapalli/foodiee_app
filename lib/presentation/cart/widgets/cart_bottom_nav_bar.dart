import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../../application/cart/cart_provider.dart';
import '../../../application/navigation_guide/navigation_guide_provider.dart';
import '../../../application/location/location_provider.dart';
import '../../../application/user_detail/user_detail_provider.dart';
import '../../core/app_colors.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';
import '../../routes/route_helper.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Dimensions.pixels100,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.pixels10, vertical: Dimensions.pixels15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.pixels20),
              color: Colors.white,
            ),
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, _) {
                return Center(
                  child: BigText(
                    text: '₹ ${cartProvider.cart.amount.getOrCrash()}',
                    size: Dimensions.font18,
                  ),
                );
              },
            ),
          ),
          Consumer<UserDetailProvider>(
            builder: (context, userDetailProvider, _) => GestureDetector(
              onTap: () async {
                final whereToOption =
                    await Provider.of<NavigationGuideProvider>(context, listen: false)
                        .checkOutButtonPressed();
                whereToOption.fold(
                  (failure) {
                    failure.map(
                      unexpected: (_) => Get.toNamed(
                        RouteHelper.getErrorPage(
                            'An Unexpected Error Occurred.\nIf The Error Persist Please Contact Support.'),
                      ),
                      unknown: (_) => Get.toNamed(
                        RouteHelper.getErrorPage('Server Error.\nPlease Try After Sometime.'),
                      ),
                    );
                  },
                  (goTo) => goTo.map(
                    noUser: (_) => Get.toNamed(RouteHelper.getAuthScreen(), arguments: true),
                    noAddress: (_) async {
                      await Provider.of<LocationProvider>(context, listen: false)
                          .getLocationCoordinates();
                      Get.toNamed(RouteHelper.getMapScreen(), arguments: [
                        'home',
                        true,
                      ]);
                    },
                    selectAddress: (_) async {
                      await Provider.of<UserDetailProvider>(context, listen: false)
                          .userDetailRequested();
                      final loggedInUser = userDetailProvider.loggedInUser;
                      Get.toNamed(RouteHelper.getSelectLocationScreen(), arguments: [
                        loggedInUser.userName.getOrCrash(),
                        loggedInUser.phoneNumber.getOrCrash(),
                        true,
                        true,
                      ]);
                    },
                  ),
                );
              },
              child: Container(
                width: Dimensions.pixels100,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.pixels10, vertical: Dimensions.pixels15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.pixels20),
                  color: AppColors.mainColor,
                ),
                child: BigText(
                  text: 'Check Out',
                  color: Colors.white,
                  size: Dimensions.font16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

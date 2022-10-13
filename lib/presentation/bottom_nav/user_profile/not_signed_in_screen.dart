import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_colors.dart';
import '../../core/dimensions.dart';
import '../../core/big_text.dart';
import '../../core/no_data_widget.dart';
import '../../routes/route_helper.dart';

class NotSignedInScreen extends StatelessWidget {
  const NotSignedInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const NoDataWidget(
              text: 'You Are Not Signed In!',
              imagePath: 'assets/images/sign_in.jpg',
            ),
            SizedBox(height: Dimensions.pixels20),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getAuthScreen(), arguments: false);
              },
              child: Container(
                height: Dimensions.pixels90 - Dimensions.pixels20,
                width: Dimensions.pixels20 * 7,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.pixels10, vertical: Dimensions.pixels15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.pixels20 + Dimensions.pixels5),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: BigText(
                    text: 'Sign In',
                    color: Colors.white,
                    size: Dimensions.font26,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

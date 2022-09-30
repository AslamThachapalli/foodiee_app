import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/dimensions.dart';

class SignInWelcomeWidget extends StatelessWidget {
  const SignInWelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.pixels20),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: TextStyle(
              fontSize: Dimensions.font20 * 3,
              color: AppColors.mainBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Sign In to your account',
            style: TextStyle(
              fontSize: Dimensions.font18,
              color: Colors.grey[500],
            ),
          ),
          SizedBox(height: Dimensions.pixels20),
        ],
      ),
    );
  }
}

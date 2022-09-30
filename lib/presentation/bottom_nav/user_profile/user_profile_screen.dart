import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';
import './widgets/account_widget.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BigText(
            text: 'Profile',
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Dimensions.pixels20),
          CircleAvatar(
            backgroundColor: AppColors.mainColor,
            child: Padding(
                padding: EdgeInsets.all(Dimensions.pixels20),
                child: Image.asset(
                  'assets/images/camera_logo.png',
                )),
            radius: 80,
          ),
          SizedBox(height: Dimensions.pixels20),
          AccountWidget(
            icon: Icons.person,
            text: 'Aslam',
          ),
          SizedBox(height: Dimensions.pixels10),
          AccountWidget(
            icon: Icons.phone,
            text: '1234567890',
            backgroundColor: AppColors.yellowColor,
          ),
          SizedBox(height: Dimensions.pixels10),
          AccountWidget(
            icon: Icons.email,
            text: 'aslam.develop912@gmail.com',
            backgroundColor: AppColors.yellowColor,
          ),
          SizedBox(height: Dimensions.pixels10),
          AccountWidget(
            icon: Icons.location_on_sharp,
            text: 'Intuc Junction, Nettoor',
            backgroundColor: Colors.red,
          ),
          SizedBox(height: Dimensions.pixels10),
          AccountWidget(
            icon: Icons.message,
            text: 'Aslam',
            backgroundColor: AppColors.yellowColor,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../application/auth/auth_provider.dart';
import '../../../../application/location/location_provider.dart';
import '../../../../application/user_detail/user_detail_provider.dart';
import '../../../../domain/user_detail/logged_in_user.dart';
import '../../../core/app_colors.dart';
import '../../../core/dimensions.dart';
import '../../../routes/route_helper.dart';
import 'account_widget.dart';

class UserDetailWidget extends StatelessWidget {
  const UserDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDetailProvider>(
      builder: (context, userDetailProvider, _) {
        LoggedInUser loggedInUser = userDetailProvider.loggedInUser;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Dimensions.pixels20),
            CircleAvatar(
              backgroundColor: AppColors.mainColor,
              radius: 80,
              child: Padding(
                  padding: EdgeInsets.all(Dimensions.pixels20),
                  child: Image.asset(
                    'assets/images/camera_logo.png',
                  )),
            ),
            SizedBox(height: Dimensions.pixels20),

            //UserName
            AccountWidget(
              icon: Icons.person,
              text: loggedInUser.userName.getOrCrash()?.toString(),
            ),
            SizedBox(height: Dimensions.pixels10),

            //PhoneNumber
            AccountWidget(
              icon: Icons.phone,
              text: loggedInUser.phoneNumber.getOrCrash()?.toString(),
              backgroundColor: AppColors.yellowColor,
            ),
            SizedBox(height: Dimensions.pixels10),

            //EmailAddress
            AccountWidget(
              icon: Icons.email,
              text: loggedInUser.emailAddress.getOrCrash(),
              backgroundColor: AppColors.yellowColor,
            ),
            SizedBox(height: Dimensions.pixels10),

            //Address
            GestureDetector(
              onTap: () async {
                await Provider.of<LocationProvider>(context, listen: false)
                    .getLocationCoordinates();
                Get.toNamed(RouteHelper.getSelectLocationScreen(), arguments: [
                  loggedInUser.userName.getOrCrash(),
                  loggedInUser.phoneNumber.getOrCrash(),
                  false, //isPaying?
                  false, //isFromCart?
                ]);
              },
              child: AccountWidget(
                icon: Icons.location_on_sharp,
                text: 'Address',
                backgroundColor: Colors.red,
              ),
            ),
            SizedBox(height: Dimensions.pixels10),

            //Logout
            GestureDetector(
              onTap: () async {
                await Provider.of<AuthProvider>(context, listen: false).signedOut();
                Get.toNamed(RouteHelper.initial);
              },
              child: AccountWidget(
                icon: Icons.exit_to_app,
                text: 'LogOut',
                backgroundColor: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodiee_app/application/auth/auth_provider.dart';
import 'package:foodiee_app/application/user_detail/user_detail_provider.dart';
import 'package:foodiee_app/presentation/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../domain/user_detail/logged_in_user.dart';
import '../../core/app_colors.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';
import './widgets/account_widget.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool isInitial = true;
  bool isLoading = false;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (isInitial) {
      setState(() {
        isLoading = true;
      });
      await Provider.of<UserDetailProvider>(context, listen: false).userDetailRequested();
      setState(() {
        isLoading = false;
      });
      isInitial = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        print(authProvider.authState.isAuthenticated);
        return !authProvider.authState.isAuthenticated
            ? Center(
                child: Text('not Authenticated'),
              )
            : isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Scaffold(
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
                    body: Consumer<UserDetailProvider>(
                      builder: (context, userDetailProvider, _) {
                        LoggedInUser loggedInUser = userDetailProvider.loggedInUser;
                        print('from consumer loggedInUser: $loggedInUser');
                        return Column(
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
                              text: loggedInUser.userName.getOrCrash().toString(),
                            ),
                            SizedBox(height: Dimensions.pixels10),
                            AccountWidget(
                              icon: Icons.phone,
                              text: loggedInUser.phoneNumber.getOrCrash().toString(),
                              backgroundColor: AppColors.yellowColor,
                            ),
                            SizedBox(height: Dimensions.pixels10),
                            AccountWidget(
                              icon: Icons.email,
                              text: loggedInUser.emailAddress.getOrCrash(),
                              backgroundColor: AppColors.yellowColor,
                            ),
                            SizedBox(height: Dimensions.pixels10),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteHelper.getSelectLocationScreen());
                              },
                              child: AccountWidget(
                                icon: Icons.location_on_sharp,
                                text: 'Address',
                                backgroundColor: Colors.red,
                              ),
                            ),
                            SizedBox(height: Dimensions.pixels10),
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
                    ),
                  );
      },
    );
  }
}

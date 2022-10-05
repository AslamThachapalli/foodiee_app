import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/auth/auth_provider.dart';
import '../../../application/user_detail/user_detail_provider.dart';
import '../../core/app_colors.dart';
import '../../core/big_text.dart';
import './widgets/user_detail_widget.dart';
import './not_signed_in_screen.dart';

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
        return !authProvider.authState.isAuthenticated
            ? const NotSignedInScreen()
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
                    body: const UserDetailWidget(),
                  );
      },
    );
  }
}

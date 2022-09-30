import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/auth/auth_provider.dart';
import '../../core/dimensions.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<AuthProvider>(context, listen: false).signInWithGooglePressed();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.065,
        margin: EdgeInsets.symmetric(horizontal: Dimensions.pixels20),
        padding: EdgeInsets.all(Dimensions.pixels5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.pixels30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                blurRadius: Dimensions.pixels5 + 3,
                // spreadRadius: 2,
                offset: const Offset(1, 3),
              )
            ]),
        child: Row(
          children: [
            Image.asset(
              'assets/images/google_logo.png',
            ),
            const VerticalDivider(),
            Text(
              'Continue with Google',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: Dimensions.font18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

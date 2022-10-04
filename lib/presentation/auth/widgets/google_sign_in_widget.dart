import 'package:flutter/material.dart';
import 'package:foodiee_app/presentation/routes/route_helper.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../../application/auth/auth_provider.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../core/dimensions.dart';

class GoogleSignInWidget extends StatelessWidget {
  final bool isFromCart;
  final AuthProvider authProvider;
  const GoogleSignInWidget({
    Key? key,
    required this.isFromCart,
    required this.authProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Provider.of<AuthProvider>(context, listen: false).signInWithGooglePressed();

        SnackBar snackBar(AuthFailure failure) {
          return SnackBar(
              content: failure.maybeMap(
            cancelledByUser: (_) => const Text('Cancelled'),
            orElse: () => const SizedBox.shrink(),
          ));
        }

        authProvider.authState.authFailureOrSuccessOption.fold(
          () => const SizedBox.shrink(),
          (either) => either.fold(
            (failure) => ScaffoldMessenger.of(context).showSnackBar(snackBar(failure)),
            (_) {
              isFromCart ? Get.back() : Get.toNamed(RouteHelper.initial);
            },
          ),
        );
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

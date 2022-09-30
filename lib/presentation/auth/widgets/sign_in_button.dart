import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/auth/auth_provider.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../core/app_colors.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';

class SignInButton extends StatelessWidget {
  final bool isRegistered;
  final AuthProvider authProvider;
  const SignInButton({
    Key? key,
    required this.isRegistered,
    required this.authProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isRegistered
            ? Provider.of<AuthProvider>(context, listen: false).signInWithEmailAndPasswordPressed()
            : Provider.of<AuthProvider>(context, listen: false)
                .registerWithEmailAndPasswordPressed();

        SnackBar snackBar(AuthFailure failure) {
          return SnackBar(
              content: failure.map(
            serverError: (_) => const Text('Server Error'),
            cancelledByUser: (_) => const Text('Cancelled'),
            invalidEmailAndPasswordCombination: (_) =>
                const Text('Invalid Email And Password Combination'),
            emailAlreadyInUse: (_) => const Text('Email Already Exists'),
          ));
        }

        authProvider.authState.authFailureOrSuccessOption.fold(
          () => const SizedBox.shrink(),
          (either) => either.fold(
            (failure) => ScaffoldMessenger.of(context).showSnackBar(snackBar(failure)),
            //if auth is success navigate, and
            //set authstate.isAuthenticated to true.
            (_) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('success')),
            ),
          ),
        );
      },
      child: Container(
        height: Dimensions.screenHeight * .08,
        width: Dimensions.screenWidth / 2 - Dimensions.pixels20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.pixels30),
          color: AppColors.mainColor,
        ),
        child: Center(
          child: BigText(
            text: isRegistered ? 'SignIn' : 'SignUp',
            color: Colors.white,
            size: Dimensions.font26 + 2,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

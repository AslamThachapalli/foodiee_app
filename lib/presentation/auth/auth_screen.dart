import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';

import '../../application/auth/auth_provider.dart';
import '../core/app_colors.dart';
import '../core/dimensions.dart';
import './widgets/text_form_field_widget.dart';
import './widgets/google_sign_in_widget.dart';
import './widgets/sign_in_button.dart';
import './widgets/sign_in_welcome_widget.dart';

class AuthScreen extends StatefulWidget {
  final bool isFromCart;
  const AuthScreen({Key? key, this.isFromCart = false}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isRegistered = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 120,
                child: Image.asset('assets/images/food_logo.png'),
              ),
              Form(
                autovalidateMode: authProvider.authState.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    if (isRegistered) const SignInWelcomeWidget(),

                    //Email field
                    TextFormFieldWidget(
                      hintText: 'Email',
                      icon: Icons.email,
                      onChanged: (value) =>
                          Provider.of<AuthProvider>(context, listen: false).emailChanged(value),
                      validator: (_) => authProvider.authState.emailAddress.value.fold(
                        (failure) => failure.maybeMap(
                          invalidEmail: (_) => 'invalid email',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: Dimensions.pixels10),

                    //Password field
                    TextFormFieldWidget(
                      hintText: 'Password',
                      icon: Icons.password,
                      onChanged: (value) =>
                          Provider.of<AuthProvider>(context, listen: false).passwordChanged(value),
                      validator: (_) => authProvider.authState.password.value.fold(
                        (failure) => failure.maybeMap(
                          shortPassword: (_) => 'password is too short',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: Dimensions.pixels10),

                    if (!isRegistered)
                      //Phone field
                      TextFormFieldWidget(
                        hintText: 'Phone',
                        icon: Icons.phone_android,
                        onChanged: (value) {
                          if (value != '') {
                            Provider.of<AuthProvider>(context, listen: false)
                                .phoneNumberChanged(int?.parse(value));
                          }
                        },
                        validator: (_) => authProvider.authState.phoneNumber.value.fold(
                          (failure) => failure.maybeMap(
                            invalidPhoneNumber: (_) => 'invalid phone number',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                      ),
                    SizedBox(height: Dimensions.pixels10),

                    if (!isRegistered)
                      //Username field
                      TextFormFieldWidget(
                        hintText: 'Name',
                        icon: Icons.person,
                        onChanged: (value) => Provider.of<AuthProvider>(context, listen: false)
                            .userNameChanged(value),
                        validator: (_) => authProvider.authState.userName.value.fold(
                          (failure) => failure.maybeMap(
                            shortUserName: (_) => 'enter at least 4 characters',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
                        keyboardType: TextInputType.name,
                      ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.pixels20),

              //SignIn or SignUp Button
              SignInButton(
                isRegistered: isRegistered,
                authProvider: authProvider,
                isFromCart: widget.isFromCart,
              ),
              SizedBox(height: Dimensions.pixels15),

              //SignIn or SignUp toggle text
              isRegistered
                  ? RichText(
                      text: TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font16,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    isRegistered = !isRegistered;
                                  });
                                },
                              text: " Create",
                              style: TextStyle(
                                color: AppColors.mainBlackColor,
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                    )
                  : RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              isRegistered = !isRegistered;
                            });
                          },
                        text: 'Already Have An Account?',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font16,
                        ),
                      ),
                    ),
              SizedBox(height: Dimensions.pixels20),

              Divider(
                thickness: Dimensions.pixels5 / 5,
                indent: Dimensions.pixels20,
                endIndent: Dimensions.pixels20,
              ),
              SizedBox(height: Dimensions.pixels20),

              //Google SignIn
              GoogleSignInWidget(
                authProvider: authProvider,
                isFromCart: widget.isFromCart,
              ),
              SizedBox(height: Dimensions.pixels10)
            ],
          ),
        ),
      ),
    );
  }
}

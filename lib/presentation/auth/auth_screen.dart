import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/auth/auth_provider.dart';
import '../../domain/auth/auth_failure.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isRegistered = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Form(
                  autovalidateMode: authProvider.authState.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(25),
                        elevation: 8,
                        shadowColor: Colors.grey[100],
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          onChanged: (value) {
                            Provider.of<AuthProvider>(context, listen: false)
                                .emailChanged(value);
                          },
                          validator: (_) =>
                              authProvider.authState.emailAddress.value.fold(
                            (failure) => failure.maybeMap(
                              invalidEmail: (_) => 'invalid email',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Material(
                        borderRadius: BorderRadius.circular(25),
                        elevation: 8,
                        shadowColor: Colors.grey[100],
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.password,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          onChanged: (value) {
                            Provider.of<AuthProvider>(context, listen: false)
                                .passwordChanged(value);
                          },
                          validator: (_) =>
                              authProvider.authState.password.value.fold(
                            (failure) => failure.maybeMap(
                              shortPassword: (_) => 'password is too short',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (!isRegistered)
                        Material(
                          borderRadius: BorderRadius.circular(25),
                          elevation: 8,
                          shadowColor: Colors.grey[100],
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Phone',
                              prefixIcon: Icon(
                                Icons.phone_android,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            onChanged: (value) {
                              if (value != '') {
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .phoneNumberChanged(int?.parse(value));
                              }
                            },
                            validator: (_) =>
                                authProvider.authState.phoneNumber.value.fold(
                              (failure) => failure.maybeMap(
                                invalidPhoneNumber: (_) =>
                                    'invalid phone number',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      if (!isRegistered)
                        Material(
                          borderRadius: BorderRadius.circular(25),
                          elevation: 8,
                          shadowColor: Colors.grey[100],
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Name',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            onChanged: (value) {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .userNameChanged(value);
                            },
                            validator: (_) =>
                                authProvider.authState.userName.value.fold(
                              (failure) => failure.maybeMap(
                                shortUserName: (_) =>
                                    'enter at least 4 characters',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tapped');
                  isRegistered
                      ? Provider.of<AuthProvider>(context, listen: false)
                          .signInWithEmailAndPasswordPressed()
                      : Provider.of<AuthProvider>(context, listen: false)
                          .registerWithEmailAndPasswordPressed();

                  SnackBar snackBar(AuthFailure failure) {
                    return SnackBar(
                        content: failure.map(
                      serverError: (_) => const Text('Server Error'),
                      cancelledByUser: (_) => const Text('Cancelled'),
                      invalidEmailAndPasswordCombination: (_) =>
                          const Text('Invalid Email And Password Combination'),
                      emailAlreadyInUse: (_) =>
                          const Text('Email Already Exists'),
                    ));
                  }

                  authProvider.authState.authFailureOrSuccessOption.fold(
                    () => const SizedBox.shrink(),
                    (either) => either.fold(
                      (failure) => ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar(failure)),
                      //if auth is success navigate, and
                      //set authstate.isAuthenticated to true.
                      (r) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('success')),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      isRegistered ? 'Sign in' : 'Sign Up',
                      style: TextStyle(
                        fontSize: 23,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isRegistered = !isRegistered;
                  });
                },
                child: SizedBox(
                  child: Text(
                    isRegistered
                        ? "Don't have an account? Create"
                        : 'Have an account?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Provider.of<AuthProvider>(context, listen: false)
                      .signInWithGooglePressed();
                },
                child: SizedBox(
                  child: Text(
                    isRegistered
                        ? 'Sign in using Google'
                        : 'Sign up using Google',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

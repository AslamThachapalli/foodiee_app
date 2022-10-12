import 'package:flutter/material.dart';

import 'dimensions.dart';

class SignInInstructionScreen extends StatelessWidget {
  final String text;
  const SignInInstructionScreen({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/do_sign_in.jpg',
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.35,
          alignment: Alignment.center,
        ),
        SizedBox(height: Dimensions.pixels10),
        Text(
          text,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.017,
            color: Theme.of(context).disabledColor,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

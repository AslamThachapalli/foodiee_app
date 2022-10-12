import 'package:flutter/material.dart';

import 'dimensions.dart';

class ErrorPage extends StatelessWidget {
  final String errorType;
  const ErrorPage({
    Key? key,
    required this.errorType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/error.jpg',
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.35,
            alignment: Alignment.center,
          ),
          SizedBox(height: Dimensions.pixels10),
          Text(
            errorType,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.017,
              color: Theme.of(context).disabledColor,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

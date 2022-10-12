import 'package:flutter/material.dart';

import './dimensions.dart';

class NoDataWidget extends StatelessWidget {
  final String text;
  final String imagePath;
  const NoDataWidget({
    Key? key,
    required this.text,
    required this.imagePath,
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
            imagePath,
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
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

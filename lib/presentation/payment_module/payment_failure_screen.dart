import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/app_colors.dart';
import '../core/big_text.dart';
import '../core/dimensions.dart';
import '../routes/route_helper.dart';

class PaymentFailureScreen extends StatelessWidget {
  final String? code;
  final String? message;
  const PaymentFailureScreen({Key? key, this.code, this.message,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/payment_failure.jpg',
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.35,
            alignment: Alignment.center,
          ),
          SizedBox(height: Dimensions.pixels10),
          Text(
            'Error $code\n$message\nPayment Failed',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.017,
              color: Theme.of(context).disabledColor,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Dimensions.pixels20),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getOrderSummaryScreen());
            },
            child: Container(
              height: Dimensions.pixels90 - Dimensions.pixels20,
              width: Dimensions.pixels20 * 7,
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.pixels10, vertical: Dimensions.pixels15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.pixels20 + Dimensions.pixels5),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: 'Try Again',
                  color: Colors.white,
                  size: Dimensions.font26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/app_colors.dart';
import '../core/big_text.dart';
import '../core/dimensions.dart';
import './widgets/address_widget.dart';
import './widgets/cart_items_widget.dart';
import './widgets/order_summary_bottom_nav.dart';
import './widgets/price_summary_widget.dart';

class OrderSummeryScreen extends StatelessWidget {
  const OrderSummeryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: 'Order Summary',
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AddressWidget(),
            const CartItemsWidget(),
            const PriceSummaryWidget(),
            //Tail quote
            SizedBox(
              height: Dimensions.pixels45,
              child: Center(
                child: Text("'You Are One Step Away From A Taste Dip'",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: Dimensions.font16,
                      color: Colors.black54,
                    )),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const OrderSummaryBottomNav(),
    );
  }
}

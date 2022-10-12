import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/cart/cart_provider.dart';
import '../../../domain/cart/cart.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';
import '../../core/small_text.dart';

class PriceSummaryWidget extends StatelessWidget {
  const PriceSummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) {
        Cart cart = cartProvider.cart;

        return Container(
          padding: EdgeInsets.all(Dimensions.pixels20),
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.pixels10,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 6,
                spreadRadius: 1,
                color: Colors.grey[300]!,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Heading; price details
              BigText(
                text: 'Price Details',
                fontWeight: FontWeight.w500,
                size: Dimensions.font18,
              ),
              SizedBox(height: Dimensions.pixels20),

              //cart amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                    text: 'Price (${cart.quantity.getOrCrash()} Items)',
                    size: Dimensions.font16,
                    color: Colors.black54,
                  ),
                  SmallText(
                    text: '₹ ${cart.amount.getOrCrash()}',
                    size: Dimensions.font16,
                    color: Colors.black54,
                  ),
                ],
              ),
              SizedBox(height: Dimensions.pixels10),

              //delivery charge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                    text: 'Delivery Charge',
                    size: Dimensions.font16,
                    color: Colors.black54,
                  ),
                  SmallText(
                    text: '₹ 30',
                    size: Dimensions.font16,
                    color: Colors.black54,
                  ),
                ],
              ),
              const Divider(),

              //total amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: 'Total Amount',
                    size: Dimensions.font16,
                    color: Colors.black87,
                  ),
                  BigText(
                    text: '₹ ${cart.amount.getOrCrash() + 30}',
                    size: Dimensions.font16,
                    color: Colors.black87,
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}

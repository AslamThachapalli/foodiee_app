import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/cart/cart_provider.dart';
import '../../core/app_colors.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.pixels90,
      padding: EdgeInsets.all(Dimensions.pixels20),
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.pixels20),
          topRight: Radius.circular(Dimensions.pixels20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Dimensions.pixels100,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.pixels10, vertical: Dimensions.pixels15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.pixels20),
              color: Colors.white,
            ),
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, _) {
                return Center(
                  child: BigText(
                    text: '₹ ${cartProvider.cart.amount.getOrCrash()}',
                    size: Dimensions.font18,
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: Dimensions.pixels100,
              padding: EdgeInsets.symmetric(horizontal: Dimensions.pixels10, vertical: Dimensions.pixels15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.pixels20),
                color: AppColors.mainColor,
              ),
              child: BigText(
                text: 'Check Out',
                color: Colors.white,
                size: Dimensions.font16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

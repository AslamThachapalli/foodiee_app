import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../application/cart/cart_provider.dart';
import '../../core/app_colors.dart';
import '../../core/app_icon.dart';
import '../../core/dimensions.dart';
import '../../routes/route_helper.dart';

class PopProductAppBar extends StatelessWidget {
  const PopProductAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.pixels45,
      left: Dimensions.pixels10,
      right: Dimensions.pixels10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: AppIcon(icon: Icons.arrow_back_ios_rounded),
          ),
          GestureDetector(
            onTap: () async {
              await Provider.of<CartProvider>(context, listen: false).openCartButtonPressed();
              Get.toNamed(RouteHelper.getCartScreen());
            },
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, _) => Stack(
                children: [
                  AppIcon(icon: Icons.shopping_cart_outlined),
                  if (cartProvider.cartCount > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: Dimensions.pixels20,
                        width: Dimensions.pixels20,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(Dimensions.pixels10),
                        ),
                        child: Center(
                          child: Text(
                            cartProvider.cartCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

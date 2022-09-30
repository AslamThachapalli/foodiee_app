import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/cart/cart_provider.dart';
import '../core/dimensions.dart';
import './widgets/cart_screen_app_bar.dart';
import './widgets/cart_items_view.dart';
import './widgets/cart_bottom_nav_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Screen Icons
          const CartScreenAppBar(),
          //Cart List
          Consumer<CartProvider>(
            builder: (context, cartProvider, _) {
              return Positioned(
                top: Dimensions.pixels100,
                right: Dimensions.pixels20,
                left: Dimensions.pixels20,
                bottom: 0,
                child: CartItemsView(
                  cart: cartProvider.cart,
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const CartBottomNavBar(),
    );
  }
}

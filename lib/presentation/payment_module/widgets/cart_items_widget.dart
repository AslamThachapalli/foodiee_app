import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/cart/cart_provider.dart';
import '../../../domain/cart/cart_item.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';
import '../../core/small_text.dart';

class CartItemsWidget extends StatelessWidget {
  const CartItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) {
        List<CartItem> cartItems = cartProvider.cart.items;

        return SizedBox(
          height: (Dimensions.pixels100 + Dimensions.pixels20 * 2) * cartItems.length,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (CartItem cartItem in cartItems) ...[
                Container(
                  padding: EdgeInsets.all(Dimensions.pixels10),
                  margin: EdgeInsets.symmetric(
                    vertical: Dimensions.pixels10,
                    horizontal: Dimensions.pixels10,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.pixels20),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Image
                      Container(
                        height: Dimensions.pixels100,
                        width: Dimensions.pixels100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.pixels15),
                          image: DecorationImage(
                            image: NetworkImage(cartItem.imageUrl.getOrCrash()!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: Dimensions.pixels10),
                      Expanded(
                        child: Column(
                          children: [
                            //product name
                            BigText(text: cartItem.name.getOrCrash()),
                            SizedBox(height: Dimensions.pixels10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //quantity
                                SmallText(
                                  text: 'Qty: ${cartItem.quantity.getOrCrash()}',
                                  size: Dimensions.font16,
                                  color: Colors.black54,
                                ),

                                //amount
                                SmallText(
                                  text:
                                      'Amount: ₹${cartItem.price.getOrCrash() * cartItem.quantity.getOrCrash()}',
                                  size: Dimensions.font16,
                                  color: Colors.black54,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]
            ],
          ),
        );
      },
    );
  }
}

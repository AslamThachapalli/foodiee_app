import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/cart/cart_provider.dart';
import '../../../domain/cart/cart.dart';
import '../../../domain/cart/cart_item.dart';
import '../../core/app_colors.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';
import '../../core/small_text.dart';

class CartItemsView extends StatelessWidget {
  final Cart cart;
  const CartItemsView({required this.cart, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (context, index) {
            CartItem cartItem = cart.items[index];
            return Container(
              height: Dimensions.pixels100,
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(vertical: Dimensions.pixels5),
              child: Row(
                children: [
                  Container(
                    height: Dimensions.pixels100,
                    width: Dimensions.pixels100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.pixels20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(cartItem.imageUrl.getOrCrash()!),
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimensions.pixels10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BigText(
                            text: cartItem.name.getOrCrash(),
                            color: Colors.black54,
                          ),
                          SmallText(text: 'Spicy'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                text: '₹${cartItem.price.getOrCrash()}',
                                color: Colors.redAccent,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await Provider.of<CartProvider>(context, listen: false).decrementCartItemQuantityPressed(
                                        productId: cartItem.productId.getOrCrash(),
                                        currentQuantity: cartItem.quantity.getOrCrash(),
                                        productPrice: cartItem.price.getOrCrash(),
                                      );
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: AppColors.signColor,
                                      size: Dimensions.iconSize24,
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.pixels5),
                                  BigText(
                                    text: cartItem.quantity.getOrCrash().toString(),
                                    color: AppColors.signColor,
                                  ),
                                  SizedBox(width: Dimensions.pixels5),
                                  GestureDetector(
                                    onTap: () async {
                                      await Provider.of<CartProvider>(context, listen: false).incrementCartItemQuantityPressed(
                                        productId: cartItem.productId.getOrCrash(),
                                        currentQuantity: cartItem.quantity.getOrCrash(),
                                        productPrice: cartItem.price.getOrCrash(),
                                      );
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.signColor,
                                      size: Dimensions.iconSize24,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

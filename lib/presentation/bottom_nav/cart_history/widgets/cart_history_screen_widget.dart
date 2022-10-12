import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../domain/cart/cart.dart';
import '../../../../domain/cart/cart_item.dart';
import '../../../../application/cart/cart_provider.dart';
import '../../../routes/route_helper.dart';
import '../../../core/app_colors.dart';
import '../../../core/big_text.dart';
import '../../../core/dimensions.dart';
import '../../../core/small_text.dart';
import '../../../core/no_data_widget.dart';

class CartHistoryScreenWidget extends StatefulWidget {
  final List<Cart> cart;
  const CartHistoryScreenWidget({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<CartHistoryScreenWidget> createState() => _CartHistoryScreenWidgetState();
}

class _CartHistoryScreenWidgetState extends State<CartHistoryScreenWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return widget.cart.isEmpty
        ? const NoDataWidget(
            text: 'Seems Like Your History Is Empty.',
            imagePath: 'assets/images/cart_history.jpg',
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: widget.cart.length,
            itemBuilder: (context, cartIndex) {
              return Container(
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.pixels10, vertical: Dimensions.pixels5),
                padding: EdgeInsets.all(Dimensions.pixels5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Created Date
                    BigText(text: widget.cart[cartIndex].createdAt.getOrCrash()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: Dimensions.pixels45 + Dimensions.pixels10 * 4,
                          width: Dimensions.pixels45 * 5 + Dimensions.pixels30,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: widget.cart[cartIndex].items.length,
                              itemBuilder: (context, index) {
                                CartItem cartItem = widget.cart[cartIndex].items[index];
                                return Container(
                                  margin: EdgeInsets.only(
                                    right: Dimensions.pixels10,
                                    top: Dimensions.pixels10,
                                  ),
                                  height: Dimensions.pixels45 + Dimensions.pixels30,
                                  width: Dimensions.pixels45 + Dimensions.pixels30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.pixels10),
                                    image: DecorationImage(
                                      image: NetworkImage(cartItem.imageUrl.getOrCrash()!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SmallText(
                              text: 'Total',
                              color: AppColors.mainBlackColor,
                            ),
                            BigText(
                              text: '${widget.cart[cartIndex].quantity.getOrCrash()} Items',
                              size: Dimensions.font16,
                            ),
                            SizedBox(height: Dimensions.pixels5),
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await Provider.of<CartProvider>(context, listen: false)
                                    .repeatCartPressed(
                                  cart: widget.cart[cartIndex],
                                );
                                Get.toNamed(RouteHelper.getCartScreen());
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: Container(
                                height: Dimensions.pixels20 + Dimensions.pixels20 / 5,
                                width: Dimensions.pixels45 + Dimensions.pixels15,
                                padding: EdgeInsets.all(Dimensions.pixels15 / 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.pixels15 / 5),
                                  border: Border.all(
                                    color: AppColors.mainColor,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: isLoading
                                      ? SizedBox(
                                          width: Dimensions.pixels20,
                                          child: const CircularProgressIndicator(
                                            color: AppColors.mainColor,
                                          ),
                                        )
                                      : const Text(
                                          'Repeat',
                                          style: TextStyle(
                                            color: AppColors.mainColor,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            });
  }
}

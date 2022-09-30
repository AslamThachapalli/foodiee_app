import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/cart/cart_provider.dart';
import '../../../application/cart/data_persistence_provider.dart';
import '../../../domain/product_fetching/product.dart';
import '../../core/app_colors.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';
import '../../core/small_text.dart';

class PopProductBottomNav extends StatelessWidget {
  final Product product;
  const PopProductBottomNav({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String productId = product.id.getOrCrash();
    int productPrice = product.price.getOrCrash();
    final dataPersistenceProvider = Provider.of<DataPersistenceProvider>(context, listen: false);

    return Consumer<DataPersistenceProvider>(
      builder: (context, dataPersistence, child) {
        int currentCount = dataPersistence.productCount.containsKey(productId) ? dataPersistence.productCount[productId]! : 0;
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
              //Increment and decrement product count button
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.pixels10,
                  vertical: Dimensions.pixels15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.pixels20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        dataPersistenceProvider.productDecremented(
                          productId,
                          currentCount,
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
                      text: currentCount.toString(),
                      color: AppColors.signColor,
                    ),
                    SizedBox(width: Dimensions.pixels5),
                    GestureDetector(
                      onTap: () {
                        dataPersistenceProvider.productIncremented(
                          productId,
                          currentCount,
                        );
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColors.signColor,
                        size: Dimensions.iconSize24,
                      ),
                    ),
                  ],
                ),
              ),
              //Add to cart button
              GestureDetector(
                onTap: () async {
                  await Provider.of<CartProvider>(context, listen: false).addToCartPressed(
                    productId: productId,
                    productCount: currentCount,
                    price: productPrice,
                    name: product.name.getOrCrash(),
                    imageUrl: product.imageUrl.getOrCrash()!,
                  );
                  dataPersistenceProvider.removeCount(productId);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.pixels10, vertical: Dimensions.pixels15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.pixels20),
                    color: AppColors.mainColor,
                  ),
                  child: SmallText(
                    text: '₹${productPrice * currentCount}|Add to Cart',
                    color: Colors.white,
                    size: Dimensions.font18,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

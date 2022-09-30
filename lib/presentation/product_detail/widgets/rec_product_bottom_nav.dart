import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/cart/cart_provider.dart';
import '../../../application/cart/data_persistence_provider.dart';
import '../../../domain/product_fetching/product.dart';
import '../../core/app_colors.dart';
import '../../core/app_icon.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';
import '../../core/small_text.dart';

class RecProductBottomNav extends StatelessWidget {
  final Product product;
  const RecProductBottomNav({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = product.id.getOrCrash();
    final productPrice = product.price.getOrCrash();
    final dataPersistenceProvider = Provider.of<DataPersistenceProvider>(context, listen: false);

    return Consumer<DataPersistenceProvider>(
      builder: (context, dataPersistence, child) {
        int currentCount = dataPersistence.productCount.containsKey(productId) ? dataPersistence.productCount[productId]! : 0;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.pixels20 * 2.5,
                vertical: Dimensions.pixels10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      dataPersistenceProvider.productDecremented(productId, currentCount);
                    },
                    child: AppIcon(
                      icon: Icons.remove,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  BigText(
                    text: ' ₹$productPrice  X  $currentCount ',
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26,
                  ),
                  GestureDetector(
                    onTap: () {
                      dataPersistenceProvider.productIncremented(productId, currentCount);
                    },
                    child: AppIcon(
                      icon: Icons.add,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.pixels15, vertical: Dimensions.pixels15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.pixels20),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                      size: Dimensions.iconSize24,
                    ),
                  ),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.pixels10,
                        vertical: Dimensions.pixels15,
                      ),
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
            ),
          ],
        );
      },
    );
  }
}

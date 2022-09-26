import 'package:flutter/material.dart';
import 'package:foodiee_app/application/product_fetching/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../core/Expandable_text_widget.dart';
import '../core/product_name_and_star_column.dart';
import '../core/app_colors.dart';
import '../core/big_text.dart';
import '../core/small_text.dart';
import '../core/dimensions.dart';
import '../core/app_icon.dart';
import '../routes/route_helper.dart';

class PopProductDetailScreen extends StatelessWidget {
  final int index;
  PopProductDetailScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, _) {
        var product = productProvider.popularProducts![index];
        bool hasImageUrl = product.imageUrl.getOrCrash() != null;
        return Scaffold(
          body: Stack(
            children: [
              //Background Image
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.productDetailImgHeight,
                  decoration: BoxDecoration(
                    image: hasImageUrl
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(product.imageUrl.getOrCrash()!))
                        : null,
                  ),
                  child: !hasImageUrl
                      ? const Center(
                          child: Text('No Preview Available'),
                        )
                      : null,
                ),
              ),
              //Page Icons
              Positioned(
                top: Dimensions.pixels45,
                left: Dimensions.pixels10,
                right: Dimensions.pixels10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.initial);
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios_rounded),
                    ),
                    AppIcon(icon: Icons.shopping_cart_outlined)
                  ],
                ),
              ),
              //Product Details
              Positioned(
                left: 0,
                right: 0,
                top: Dimensions.productDetailImgHeight - Dimensions.pixels20,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.pixels20,
                    left: Dimensions.pixels20,
                    right: Dimensions.pixels20,
                    bottom: 1,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.pixels20),
                      topLeft: Radius.circular(Dimensions.pixels20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductNameAndStarColumn(
                        text: product.name.getOrCrash(),
                        size: Dimensions.font26,
                        stars: product.stars.getOrCrash().toDouble(),
                        location: product.location.getOrCrash(),
                      ),
                      SizedBox(height: Dimensions.pixels10),
                      BigText(
                        text: 'Description',
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: Dimensions.pixels10),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                            text: product.description.getOrCrash(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
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
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.pixels10,
                      vertical: Dimensions.pixels15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.pixels20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                        size: Dimensions.iconSize24,
                      ),
                      SizedBox(width: Dimensions.pixels5),
                      BigText(
                        text: '0',
                        color: AppColors.signColor,
                      ),
                      SizedBox(width: Dimensions.pixels5),
                      Icon(
                        Icons.add,
                        color: AppColors.signColor,
                        size: Dimensions.iconSize24,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.pixels10,
                      vertical: Dimensions.pixels15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.pixels20),
                    color: AppColors.mainColor,
                  ),
                  child: SmallText(
                    text: '₹230|Add to Cart',
                    color: Colors.white,
                    size: Dimensions.font18,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

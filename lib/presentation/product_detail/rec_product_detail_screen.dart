import 'package:flutter/material.dart';
import 'package:foodiee_app/application/product_fetching/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../core/Expandable_text_widget.dart';
import '../core/app_colors.dart';
import '../core/app_icon.dart';
import '../core/big_text.dart';
import '../core/small_text.dart';
import '../core/dimensions.dart';
import '../routes/route_helper.dart';

class RecProductDetailScreen extends StatelessWidget {
  final int index;
  RecProductDetailScreen({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productProvider, _) {
      var product = productProvider.recommendedProducts![index];
      return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: Colors.blueGrey,
              expandedHeight: 300,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.initial);
                    },
                    child: AppIcon(icon: Icons.clear),
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.pixels5,
                    bottom: Dimensions.pixels10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.pixels20),
                      topRight: Radius.circular(Dimensions.pixels20),
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: BigText(
                      text: product.name.getOrCrash(),
                    ),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: product.imageUrl.getOrCrash() != null
                    ? Image.network(
                        product.imageUrl.getOrCrash()!,
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Text('No Preview Available'),
                      ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.pixels20,
                  vertical: Dimensions.pixels5,
                ),
                child: ExpandableTextWidget(
                  text: product.description.getOrCrash(),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
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
                  AppIcon(
                    icon: Icons.remove,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                  BigText(
                    text: ' ₹120 ' + ' X ' + ' 0 ',
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26,
                  ),
                  AppIcon(
                    icon: Icons.add,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
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
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.pixels15,
                        vertical: Dimensions.pixels15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.pixels20),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
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
          ],
        ),
      );
    });
  }
}

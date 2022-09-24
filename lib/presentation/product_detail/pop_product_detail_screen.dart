import 'package:flutter/material.dart';

import '../core/Expandable_text_widget.dart';
import '../core/product_name_and_star_column.dart';
import '../core/app_colors.dart';
import '../core/big_text.dart';
import '../core/small_text.dart';
import '../core/dimensions.dart';
import '../core/app_icon.dart';

class PopProductDetailScreen extends StatelessWidget {
  const PopProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/burger.jpg',
                      ))),
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
                AppIcon(icon: Icons.arrow_back_ios_rounded),
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
                    text: 'Burger And Fries',
                    size: Dimensions.font26,
                    stars: 5,
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
                          text:
                              'Mobile app development is the act or process by which a mobile app is developed for mobile devices, such as personal digital assistants, enterprise digital assistants or mobile phones. These software applications are designed to run on mobile devices, such as a smartphone or tablet computer. These applications can be pre-installed on phones during manufacturing platforms, or delivered as web applications using server-side or client-side processing (e.g., JavaScript) to provide an "application-like" experience within a web browser. Application software developers also must consider a long array of screen sizes, hardware specifications, and configurations because of intense competition in mobile software and changes within each of the platforms. Mobile app development has been steadily growing, in revenues and jobs created. A 2013 analyst report estimates there are 529,000 direct app economy jobs within the EU then 28 members (including the UK), 60 percent of which are mobile app developers.'),
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
  }
}

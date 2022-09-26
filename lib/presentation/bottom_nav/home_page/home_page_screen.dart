import 'package:flutter/material.dart';

import '../../core/dimensions.dart';
import '../../core/app_colors.dart';
import '../../core/big_text.dart';
import '../../core/small_text.dart';
import './widgets/popular_food_intermediary.dart';
import './widgets/recommended_food_intermediary.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //AppBar Portion
          Container(
            margin: EdgeInsets.only(top: Dimensions.pixels45),
            padding: EdgeInsets.symmetric(horizontal: Dimensions.pixels20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'India',
                      color: AppColors.mainColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: 'Kochi',
                          color: Colors.black54,
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          size: Dimensions.pixels24,
                        )
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: Dimensions.pixels5),
                    height: Dimensions.pixels45,
                    width: Dimensions.pixels45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.pixels15),
                      color: AppColors.mainColor,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimensions.pixels24,
                    ),
                  ),
                )
              ],
            ),
          ),
          //The scrollable products view body portion
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const PopularFoodIntermediary(),
                  SizedBox(height: Dimensions.pixels30),
                  const RecommendedFoodIntermediary(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

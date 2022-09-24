import 'package:flutter/material.dart';
import 'package:foodiee_app/presentation/core/big_text.dart';
import 'package:foodiee_app/presentation/core/dimensions.dart';
import 'package:foodiee_app/presentation/core/small_text.dart';

import '../../../core/app_colors.dart';
import '../../../core/icon_and_text_widget.dart';

class RecommendedFoodView extends StatelessWidget {
  const RecommendedFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Header for the recommended section
        Padding(
          padding: EdgeInsets.only(left: Dimensions.pixels20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(width: Dimensions.pixels10),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: BigText(text: '.', color: Colors.black26),
              ),
              SizedBox(width: Dimensions.pixels10),
              SmallText(text: 'Food Pairing'),
            ],
          ),
        ),

        //The recommended products list builder
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.pixels20,
                  vertical: Dimensions.pixels5,
                ),
                child: Row(
                  children: [
                    //Image holder
                    Container(
                      width: Dimensions.recProductImgViewSize,
                      height: Dimensions.recProductImgViewSize,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius:
                            BorderRadius.circular(Dimensions.pixels20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/burger.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //product text view container
                    Expanded(
                      child: Container(
                        height: Dimensions.recProductViewContainer,
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.pixels5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.pixels15),
                            bottomRight: Radius.circular(Dimensions.pixels15),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: 'Nutritious Fruit Meal in India'),
                            SizedBox(height: Dimensions.pixels10),
                            SmallText(text: 'With Indian Characteristics'),
                            SizedBox(height: Dimensions.pixels15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                IconAndTextWidget(
                                  text: 'Normal',
                                  icon: Icons.circle_sharp,
                                  iconColor: AppColors.iconColor1,
                                ),
                                IconAndTextWidget(
                                  text: '1.7 km',
                                  icon: Icons.location_on,
                                  iconColor: AppColors.mainColor,
                                ),
                                IconAndTextWidget(
                                  text: '32 min',
                                  icon: Icons.access_time_outlined,
                                  iconColor: AppColors.iconColor2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }
}

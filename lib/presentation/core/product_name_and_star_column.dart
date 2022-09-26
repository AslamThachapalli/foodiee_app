import 'package:flutter/material.dart';

import './small_text.dart';
import './app_colors.dart';
import './big_text.dart';
import './dimensions.dart';
import './icon_and_text_widget.dart';

class ProductNameAndStarColumn extends StatelessWidget {
  final String text;
  final double size;
  final double stars;
  String? location;

  ProductNameAndStarColumn({
    required this.text,
    this.size = 0,
    required this.stars,
    this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BigText(text: text, size: size),
        SizedBox(height: Dimensions.pixels10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                stars.round(),
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: Dimensions.pixels15,
                ),
              ),
            ),
            SizedBox(width: Dimensions.pixels5),
            SmallText(text: stars.toString()),
            SizedBox(width: Dimensions.pixels5),
            SmallText(text: '1024 comments'),
          ],
        ),
        SizedBox(height: Dimensions.pixels15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IconAndTextWidget(
              text: 'Normal',
              icon: Icons.circle_sharp,
              iconColor: AppColors.iconColor1,
            ),
            IconAndTextWidget(
              text: location == null ? '1.7 km' : location!,
              icon: Icons.location_on,
              iconColor: AppColors.mainColor,
            ),
            const IconAndTextWidget(
              text: '32 min',
              icon: Icons.access_time_outlined,
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}

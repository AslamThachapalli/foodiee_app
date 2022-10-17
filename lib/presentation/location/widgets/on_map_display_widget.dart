import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_icon.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';

class OnMapDisplayWidget extends StatelessWidget {
  final String text;
   OnMapDisplayWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: Dimensions.pixels5),
      margin: EdgeInsets.symmetric(horizontal: Dimensions.pixels20, vertical: Dimensions.pixels10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.pixels30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              offset: const Offset(0, 1),
              blurRadius: 5,
            )
          ]),
      child: Row(
        children: [
          AppIcon(
            icon: Icons.location_on_outlined,
            backgroundColor: Colors.white,
            iconColor: AppColors.mainColor,
            size: Dimensions.pixels10 * 5,
            iconSize: Dimensions.pixels10 * 5 / 2,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BigText(
                    text: text,
                    fontWeight: FontWeight.w400,
                    size: Dimensions.font18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_icon.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';

class DisplayWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  Color? backgroundColor;
  Color? iconColor;
  DisplayWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.backgroundColor = AppColors.mainColor,
    this.iconColor = Colors.white,
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
            icon: icon,
            backgroundColor: backgroundColor!,
            iconColor: iconColor!,
            size: Dimensions.pixels10 * 5,
            iconSize: Dimensions.pixels10 * 5 / 2,
          ),
          SizedBox(width: Dimensions.pixels10),
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

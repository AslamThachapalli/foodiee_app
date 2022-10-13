import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_icon.dart';
import '../../../core/big_text.dart';
import '../../../core/dimensions.dart';

class AccountWidget extends StatelessWidget {
  final IconData icon;
  final String? text;
  Color? backgroundColor;
  AccountWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.backgroundColor = AppColors.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.pixels10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
            iconColor: Colors.white,
            size: Dimensions.pixels10 * 5,
            iconSize: Dimensions.pixels10 * 5 / 2,
          ),
          SizedBox(width: Dimensions.pixels10),
          BigText(
            text: text ?? '',
            fontWeight: FontWeight.w400,
            size: Dimensions.font18,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import './dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  FontWeight fontWeight;
  double size;
  TextOverflow overflow;

  BigText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.size = 0,
    this.fontWeight = FontWeight.w600,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontWeight: fontWeight,
      ),
    );
  }
}

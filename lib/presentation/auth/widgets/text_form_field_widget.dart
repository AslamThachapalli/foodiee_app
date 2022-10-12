import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/dimensions.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  int? maxLength;
  TextInputType? keyboardType;
  bool obscureText;
  TextFormFieldWidget({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.validator,
    this.maxLength,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.pixels45 + Dimensions.pixels15,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.pixels20),
      padding: EdgeInsets.all(Dimensions.pixels5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.pixels30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              blurRadius: Dimensions.pixels5 + 3,
              // spreadRadius: 2,
              offset: const Offset(1, 3),
            )
          ]),
      child: Center(
        child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: AppColors.mainColor,
            ),
            hintText: hintText,
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.pixels30),
              borderSide: BorderSide.none,
            ),
          ),
          maxLength: maxLength,
          keyboardType: keyboardType,
          obscureText: obscureText,
        ),
      ),
    );
  }
}

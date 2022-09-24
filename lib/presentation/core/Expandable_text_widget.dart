import 'package:flutter/material.dart';

import './app_colors.dart';
import './dimensions.dart';
import './small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({required this.text, Key? key}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstText;
  late String secondText;

  bool hiddenText = true;

  final double textHeight = Dimensions.screenHeight / 7.8;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstText = widget.text.substring(0, textHeight.toInt());
      secondText =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstText = widget.text;
      secondText = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.text.length < textHeight
        ? SmallText(
            text: firstText,
            color: AppColors.paraColor,
            height: 1.5,
            size: Dimensions.font16,
          )
        : Column(
            children: [
              SmallText(
                text: hiddenText ? '$firstText...' : '$firstText$secondText',
                color: AppColors.paraColor,
                height: 1.5,
                size: Dimensions.font16,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    hiddenText = !hiddenText;
                  });
                },
                child: Row(
                  children: [
                    SmallText(
                      text: hiddenText ? 'show more' : 'show less',
                      color: AppColors.mainColor,
                    ),
                    Icon(
                      hiddenText
                          ? Icons.arrow_drop_down_outlined
                          : Icons.arrow_drop_up_outlined,
                      color: AppColors.mainColor,
                    ),
                  ],
                ),
              )
            ],
          );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/location/location_provider.dart';
import '../../core/app_colors.dart';
import '../../core/dimensions.dart';

class ChooseLocationWidget extends StatelessWidget {
  final int selectedIndex;
  const ChooseLocationWidget({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.pixels15),
      child: SizedBox(
        height: Dimensions.pixels45 + Dimensions.pixels10,
        width: double.maxFinite,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Provider.of<LocationProvider>(context, listen: false).locationTypeSelected(index);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.pixels5),
                  width: Dimensions.pixels45 + Dimensions.pixels10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.pixels5),
                    color: Colors.white,
                  ),
                  child: Icon(
                    index == 0
                        ? Icons.home_filled
                        : index == 1
                            ? Icons.work
                            : Icons.location_on,
                    size: Dimensions.iconSize24,
                    color: selectedIndex == index
                        ? AppColors.mainColor
                        : Theme.of(context).disabledColor,
                  ),
                ),
              );
            }),
      ),
    );
  }
}

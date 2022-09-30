import 'package:flutter/material.dart';

import '../../../domain/product_fetching/product.dart';
import '../../core/Expandable_text_widget.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';
import '../../core/product_name_and_star_column.dart';

class PopProductDetailsWidget extends StatelessWidget {
  final Product product;
  const PopProductDetailsWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: Dimensions.productDetailImgHeight - Dimensions.pixels20,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(
          top: Dimensions.pixels20,
          left: Dimensions.pixels20,
          right: Dimensions.pixels20,
          bottom: 1,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.pixels20),
            topLeft: Radius.circular(Dimensions.pixels20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductNameAndStarColumn(
              text: product.name.getOrCrash(),
              size: Dimensions.font26,
              stars: product.stars.getOrCrash().toDouble(),
              location: product.location.getOrCrash(),
            ),
            SizedBox(height: Dimensions.pixels10),
            BigText(
              text: 'Description',
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: Dimensions.pixels10),
            Expanded(
              child: SingleChildScrollView(
                child: ExpandableTextWidget(
                  text: product.description.getOrCrash(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

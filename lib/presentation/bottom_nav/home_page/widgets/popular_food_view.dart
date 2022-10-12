import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:kt_dart/collection.dart';
import 'package:provider/provider.dart';

import '../../../../application/cart/cart_provider.dart';
import '../../../../domain/product_fetching/product.dart';
import '../../../core/product_name_and_star_column.dart';
import '../../../core/dimensions.dart';
import '../../../core/app_colors.dart';
import '../../../routes/route_helper.dart';

class PopularFoodView extends StatefulWidget {
  final KtList<Product> products;
  const PopularFoodView(this.products, {Key? key}) : super(key: key);

  @override
  _PopularFoodViewState createState() => _PopularFoodViewState();
}

class _PopularFoodViewState extends State<PopularFoodView> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.productViewParentContainer,
          child: PageView.builder(
              controller: pageController,
              itemCount: widget.products.size,
              itemBuilder: (context, index) {
                return _popularFoodItem(index, widget.products);
              }),
        ),
        DotsIndicator(
          dotsCount: widget.products.size,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _popularFoodItem(int index, KtList<Product> products) {
    bool hasImageUrl = products[index].imageUrl.getOrCrash() != null;
    return Stack(
      children: [
        //Image holder
        GestureDetector(
          onTap: () {
            Provider.of<CartProvider>(context, listen: false).productDetailPageOpened();
            Get.toNamed(RouteHelper.getPopularFood(index));
          },
          child: Container(
            height: Dimensions.productViewContainer,
            margin: EdgeInsets.only(
              left: Dimensions.pixels10,
              right: Dimensions.pixels10,
              top: Dimensions.pixels10,
            ),
            decoration: BoxDecoration(
              color: index.isEven ? Colors.grey : Colors.blueGrey,
              borderRadius: BorderRadius.circular(Dimensions.pixels30),
              image: hasImageUrl
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(products[index].imageUrl.getOrCrash()!),
                    )
                  : null,
            ),
            child: !hasImageUrl
                ? const Center(
                    child: Text('No Preview Available'),
                  )
                : null,
          ),
        ),
        //Product Text view container
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.productViewTextContainer,
            margin: EdgeInsets.only(
              left: Dimensions.pixels30,
              right: Dimensions.pixels30,
              bottom: Dimensions.pixels20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.pixels20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.pixels10),
              child: ProductNameAndStarColumn(
                text: products[index].name.getOrCrash(),
                stars: products[index].stars.getOrCrash().toDouble(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// double _scaleFactor = 0.8;
// double _height = 220;
//

//
// @override
// void dispose() {
//   super.dispose();
//   pageController.dispose();
// }

// Matrix4 matrix = Matrix4.identity();
// if (index == _currentPageValue.floor()) {
//   var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
//   var currTrans = _height * (1 - currScale) / 2;
//   matrix = Matrix4.diagonal3Values(1, currScale, 1)
//     ..setTranslationRaw(0, currTrans, 0);
// } else if (index == _currentPageValue.floor() + 1) {
//   var currScale =
//       _scaleFactor + (_currentPageValue - index) * (1 - _scaleFactor);
//   var currTrans = _height * (1 - currScale) / 2;
//   matrix = Matrix4.diagonal3Values(1, currScale, 1)
//     ..setTranslationRaw(0, currTrans, 0);
// } else if (index == _currentPageValue.floor() - 1) {
//   var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
//   var currTrans = _height * (1 - currScale) / 2;
//   matrix = Matrix4.diagonal3Values(1, currScale, 1)
//     ..setTranslationRaw(0, currTrans, 0);
// } else {
//   var currScale = 0.8;
//   var currTrans = _height * (1 - currScale) / 2;
//   matrix = Matrix4.diagonal3Values(1, currScale, 1)
//     ..setTranslationRaw(0, currTrans, 0);
// }

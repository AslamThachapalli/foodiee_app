import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/product_fetching/product_provider.dart';
import '../../domain/product_fetching/product.dart';
import '../core/dimensions.dart';
import './widgets/pop_product_app_bar.dart';
import './widgets/pop_product_datails_widget.dart';
import './widgets/pop_product_bottom_nav.dart';

class PopProductDetailScreen extends StatelessWidget {
  final int index;

  const PopProductDetailScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<ProductProvider>(context, listen: false).popularProducts![index];
    bool hasImageUrl = product.imageUrl.getOrCrash() != null;
    return Scaffold(
      body: Stack(
        children: [
          //Background Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.productDetailImgHeight,
              decoration: BoxDecoration(
                image: hasImageUrl ? DecorationImage(fit: BoxFit.cover, image: NetworkImage(product.imageUrl.getOrCrash()!)) : null,
              ),
              child: !hasImageUrl
                  ? const Center(
                      child: Text('No Preview Available'),
                    )
                  : null,
            ),
          ),
          //Page Icons
          const PopProductAppBar(),
          //Product Details
          PopProductDetailsWidget(product: product),
        ],
      ),
      bottomNavigationBar: PopProductBottomNav(
        product: product,
      ),
    );
  }
}

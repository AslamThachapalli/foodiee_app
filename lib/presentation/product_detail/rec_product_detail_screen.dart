import 'package:flutter/material.dart';
import 'package:foodiee_app/presentation/product_detail/widgets/rec_product_bottom_nav.dart';
import 'package:provider/provider.dart';

import '../../application/product_fetching/product_provider.dart';
import '../core/Expandable_text_widget.dart';
import '../core/big_text.dart';
import '../core/dimensions.dart';
import './widgets/rec_product_app_icons.dart';

class RecProductDetailScreen extends StatelessWidget {
  final int index;
  const RecProductDetailScreen({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<ProductProvider>(context, listen: false).recommendedProducts![index];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Colors.blueGrey,
            expandedHeight: 300,
            toolbarHeight: 70,
            title: const RecProductAppIcons(),
            //product name
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.pixels20),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.pixels5,
                  bottom: Dimensions.pixels10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.pixels20),
                    topRight: Radius.circular(Dimensions.pixels20),
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: BigText(
                    text: product.name.getOrCrash(),
                  ),
                ),
              ),
            ),
            //product Image
            flexibleSpace: FlexibleSpaceBar(
              background: product.imageUrl.getOrCrash() != null
                  ? Image.network(
                      product.imageUrl.getOrCrash()!,
                      fit: BoxFit.cover,
                    )
                  : const Center(
                      child: Text('No Preview Available'),
                    ),
            ),
          ),
          //product description
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.pixels20,
                vertical: Dimensions.pixels5,
              ),
              child: ExpandableTextWidget(
                text: product.description.getOrCrash(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: RecProductBottomNav(product: product),
    );
  }
}

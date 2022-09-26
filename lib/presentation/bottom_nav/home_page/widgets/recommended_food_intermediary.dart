import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:kt_dart/collection.dart';

import '../../../../application/product_fetching/product_provider.dart';
import '../../../../domain/product_fetching/product.dart';
import '../../../../domain/product_fetching/product_failure.dart';
import './recommended_food_view.dart';

class RecommendedFoodIntermediary extends StatefulWidget {
  const RecommendedFoodIntermediary({Key? key}) : super(key: key);

  @override
  State<RecommendedFoodIntermediary> createState() =>
      _RecommendedFoodIntermediaryState();
}

class _RecommendedFoodIntermediaryState
    extends State<RecommendedFoodIntermediary> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero).then(
  //     (value) =>
  //         Provider.of<ProductProvider>(context, listen: false).uploadRecommendedProductImage(),
  //   );
  // }
  Future<dartz.Either<ProductFailure, KtList<Product>>>? fetchRecommended;
  bool fetchingRecommended = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (fetchingRecommended) {
      fetchRecommended = Provider.of<ProductProvider>(context, listen: false)
          .fetchRecommended();
      fetchingRecommended = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchRecommended,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox.shrink();
          } else {
            dartz.Either<ProductFailure, KtList<Product>> recommendedProducts =
                snapshot.data as dartz.Either<ProductFailure, KtList<Product>>;
            return recommendedProducts.fold(
              (_) => const SizedBox.shrink(),
              (products) => RecommendedFoodView(products),
            );
          }
        });
  }
}

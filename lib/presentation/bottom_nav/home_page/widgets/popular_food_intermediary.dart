import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:kt_dart/collection.dart';

import '../../../../application/product_fetching/product_provider.dart';
import '../../../../domain/product_fetching/product.dart';
import '../../../../domain/product_fetching/product_failure.dart';
import './popular_food_view.dart';

class PopularFoodIntermediary extends StatefulWidget {
  const PopularFoodIntermediary({Key? key}) : super(key: key);

  @override
  State<PopularFoodIntermediary> createState() =>
      _PopularFoodIntermediaryState();
}

class _PopularFoodIntermediaryState extends State<PopularFoodIntermediary> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero).then(
  //     (value) =>
  //         Provider.of<ProductProvider>(context, listen: false).uploadPopularProductImage(),
  //   );
  // }
  Future<dartz.Either<ProductFailure, KtList<Product>>>? fetchPopular;
  bool fetchingPopular = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (fetchingPopular) {
      fetchPopular =
          Provider.of<ProductProvider>(context, listen: false).fetchPopular();
      fetchingPopular = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPopular,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            dartz.Either<ProductFailure, KtList<Product>> popularProducts =
                snapshot.data as dartz.Either<ProductFailure, KtList<Product>>;
            return popularProducts.fold(
              (failure) => failure.map(
                unexpected: (_) => const Center(
                  child: Text(
                    'An Unexpected Error Occured.\nPlease Contact Support.',
                    textAlign: TextAlign.center,
                  ),
                ),
                serverError: (_) => const Center(
                  child: Text(
                    'Server Error.\nPlease Try After Sometime.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              (products) => PopularFoodView(products),
            );
          }
        });
  }
}

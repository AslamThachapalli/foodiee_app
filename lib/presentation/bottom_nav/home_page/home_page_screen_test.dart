import 'package:dartz/dartz.dart' as dart;
import 'package:flutter/material.dart';
import 'package:foodiee_app/application/product_fetching/product_provider.dart';
import 'package:kt_dart/kt.dart';
import 'package:provider/provider.dart';

import '../../../domain/product_fetching/product.dart';
import '../../../domain/product_fetching/product_failure.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  Future<dart.Either<ProductFailure, KtList<Product>>>? fetchRecommended;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      fetchRecommended = Provider.of<ProductProvider>(context, listen: false)
          .fetchRecommended();
    });
  }

  // bool fetchingProducts = true;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (fetchingProducts) {
  //     fetchRecommended = Provider.of<ProductProvider>(context, listen: false)
  //         .fetchRecommended();
  //     fetchingProducts = false;
  //   }
  // }

  // @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchRecommended,
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Connection State'),
            );
          } else if (snapShot.hasData) {
            dart.Either<ProductFailure, KtList<Product>> recommendedProducts =
                snapShot.data as dart.Either<ProductFailure, KtList<Product>>;
            return recommendedProducts.fold(
              (_) => Container(
                height: 200,
                width: 200,
                color: Colors.red,
                child: Center(
                  child: Text('Some failure occured'),
                ),
              ),
              (products) => products.isEmpty()
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Container(
                          height: 250,
                          width: 200,
                          color: Colors.grey,
                          child: Center(
                            child: Text(products[0].name.getOrCrash()),
                          ),
                        ),
                        Container(
                          height: 250,
                          width: 200,
                          color: Colors.grey,
                          child: Center(
                            child: Text(products[1].name.getOrCrash()),
                          ),
                        ),
                      ],
                    ),
            );
          } else {
            return Container();
          }
        });
  }
}

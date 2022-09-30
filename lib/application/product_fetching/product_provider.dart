import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/product_fetching/i_product_repository.dart';
import '../../domain/product_fetching/product.dart';
import '../../domain/product_fetching/product_failure.dart';

@injectable
class ProductProvider with ChangeNotifier {
  final IProductRepository _productRepository;
  ProductProvider(this._productRepository);

  Either<ProductFailure, KtList<Product>> _popularProducts =
      right(<Product>[].toImmutableList());
  Either<ProductFailure, KtList<Product>> _recommendedProducts =
      right(<Product>[].toImmutableList());

  KtList<Product>? get popularProducts => _popularProducts.fold(
        (_) => null,
        (products) => products,
      );

  KtList<Product>? get recommendedProducts => _recommendedProducts.fold(
        (_) => null,
        (products) => products,
      );

  Future<Either<ProductFailure, KtList<Product>>> fetchPopular() async {
    Stream<Either<ProductFailure, KtList<Product>>> popularStream;
    popularStream = _productRepository.fetchPopular();

    Either<ProductFailure, KtList<Product>> failureOrSuccess;
    await for (failureOrSuccess in popularStream) {
      _popularProducts = failureOrSuccess.fold(
        (failure) => left(failure),
        (products) => right(products),
      );
      return _popularProducts;
    }
    return _popularProducts;
  }

  Future<Either<ProductFailure, KtList<Product>>> fetchRecommended() async {
    Stream<Either<ProductFailure, KtList<Product>>> recommendedStream;
    recommendedStream = _productRepository.fetchRecommended();

    Either<ProductFailure, KtList<Product>> failureOrSuccess;
    await for (failureOrSuccess in recommendedStream) {
      _recommendedProducts = failureOrSuccess.fold(
        (failure) => left(failure),
        (products) => right(products),
      );
      return _recommendedProducts;
    }
    return _recommendedProducts;
  }

  //The both upload methods are aimed for backend maintenance.
  //Both methods are used to update the imageUrl in the cloud_firestore.
  //Whenever an image is uploaded in the cloud storage both these methods are called
  //via initstate methods in the ui page and the respective imageUrls are updated.

  //These methods have to be called only when an imageUrl update is necessary, else comment it out.

  Future<void> uploadPopularProductImage() async {
    await for (Option<dynamic> _
        in _productRepository.uploadPopularProductImage()) {}
    notifyListeners();
  }

  Future<void> uploadRecommendedProductImage() async {
    await for (Option<dynamic> _
        in _productRepository.uploadRecommendedProductImage()) {}
    notifyListeners();
  }
}

import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import './product.dart';
import './product_failure.dart';

abstract class IProductRepository {
  Stream<Either<ProductFailure, KtList<Product>>> fetchPopular();
  Stream<Either<ProductFailure, KtList<Product>>> fetchRecommended();
  Stream<Option> uploadPopularProductImage();
  Stream<Option> uploadRecommendedProductImage();
}

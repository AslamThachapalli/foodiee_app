import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/product_fetching/i_product_repository.dart';
import '../../domain/product_fetching/product.dart';
import '../../domain/product_fetching/product_failure.dart';
import './product_dtos.dart';

@LazySingleton(as: IProductRepository)
class ProductRepository implements IProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;
  ProductRepository(this._firebaseFirestore, this._firebaseStorage);

  @override
  Stream<Either<ProductFailure, KtList<Product>>> fetchPopular() async* {
    final popularProductsSnap =
        _firebaseFirestore.collection('PopularProducts').snapshots();

    yield* popularProductsSnap.map((snapshot) {
      return right<ProductFailure, KtList<Product>>(
        snapshot.docs.map((doc) {
          return ProductDtos.fromFirebase(doc).toDomain();
        }).toImmutableList(),
      );
    }).handleError((error) {
      if (error is FirebaseException) {
        return left(const ProductFailure.unexpected());
      } else {
        return left(const ProductFailure.serverError());
      }
    });
  }

  @override
  Stream<Either<ProductFailure, KtList<Product>>> fetchRecommended() async* {
    final recommendedProductsSnap =
        _firebaseFirestore.collection('RecommendedProducts').snapshots();

    yield* recommendedProductsSnap.map((snapshot) {
      return right<ProductFailure, KtList<Product>>(
        snapshot.docs.map((doc) {
          return ProductDtos.fromFirebase(doc).toDomain();
        }).toImmutableList(),
      );
    }).handleError((error) {
      if (error is FirebaseException) {
        return left(const ProductFailure.unexpected());
      } else {
        return left(const ProductFailure.serverError());
      }
    });
  }

  @override
  Stream<Option> uploadPopularProductImage() async* {
    final popProductsSnap =
        _firebaseFirestore.collection('PopularProducts').snapshots();

    yield* popProductsSnap.map((snapshot) {
      return optionOf(
        snapshot.docs.map((doc) async {
          String imageUrl;
          imageUrl = await _firebaseStorage
              .ref()
              .child('${doc.id}.jpg')
              .getDownloadURL();
          await _firebaseFirestore
              .collection('PopularProducts')
              .doc(doc.id)
              .update({'imageUrl': imageUrl});
        }),
      );
    });
  }

  @override
  Stream<Option> uploadRecommendedProductImage() async* {
    final recProductsSnap =
        _firebaseFirestore.collection('RecommendedProducts').snapshots();

    yield* recProductsSnap.map((snapshot) {
      return optionOf(
        snapshot.docs.map((doc) async {
          String imageUrl;
          imageUrl = await _firebaseStorage
              .ref()
              .child('${doc.id}.jpg')
              .getDownloadURL();
          await _firebaseFirestore
              .collection('RecommendedProducts')
              .doc(doc.id)
              .update({'imageUrl': imageUrl});
        }),
      );
    });
  }
}

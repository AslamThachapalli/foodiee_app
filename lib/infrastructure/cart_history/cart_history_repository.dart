import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodiee_app/domain/cart/cart.dart';
import 'package:foodiee_app/domain/cart_history/i_cart_history_repo.dart';
import 'package:foodiee_app/domain/core/firestore_failures.dart';
import 'package:foodiee_app/infrastructure/cart/cart_dtos.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ICartHistoryRepo)
class CartHistoryRepository implements ICartHistoryRepo {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  CartHistoryRepository(this._firebaseFirestore, this._firebaseAuth);

  @override
  Future<Either<FirestoreFailure, Unit>> addToServer({
    required Cart cart,
  }) async {
    User? currentUser = _firebaseAuth.currentUser;

    try {
      await _firebaseFirestore
          .collection('users')
          .doc(currentUser!.uid)
          .collection('cartHistory')
          .doc(cart.cartId.getOrCrash())
          .set(CartDto.fromDomain(cart).toJson());
      return right(unit);
    } on FirebaseException catch (_) {
      return left(const FirestoreFailure.unexpected());
    } catch (_) {
      return left(const FirestoreFailure.serverError());
    }
  }

  @override
  Stream<Either<FirestoreFailure, List<Cart>>> fetchCart() async* {
    User? currentUser = _firebaseAuth.currentUser;

    final userDoc = _firebaseFirestore.collection('users').doc(currentUser?.uid);

    yield* userDoc.collection('cartHistory').snapshots().map(
      (snapshot) {
        if (snapshot.docs.isEmpty) {
          return right<FirestoreFailure, List<Cart>>(<Cart>[]);
        }
        return right<FirestoreFailure, List<Cart>>(
          snapshot.docs
              .map(
                (doc) => CartDto.fromJson(doc.data()).toDomain(),
              )
              .toList()
              .reversed
              .toList(),
        );
      },
    ).handleError((error) {
      if (error is FirebaseException) {
        return left(const FirestoreFailure.unexpected());
      } else {
        return left(const FirestoreFailure.serverError());
      }
    });
  }
}

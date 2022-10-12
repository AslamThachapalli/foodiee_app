import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../domain/core/firestore_failures.dart';
import '../../domain/order/i_order_repository.dart';
import '../../domain/order/order.dart' as order;
import './order_dtos.dart';

@LazySingleton(as: IOrderRepository)
class OrderRepository implements IOrderRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  OrderRepository(this._firebaseFirestore, this._firebaseAuth);

  @override
  Future<Either<FirestoreFailure, Unit>> saveToServer(order.Order order) async {
    User? currentUser = _firebaseAuth.currentUser;

    try {
      await _firebaseFirestore
          .collection('users')
          .doc(currentUser!.uid)
          .collection('orders')
          .doc(order.orderId.getOrCrash())
          .set(OrderDtos.fromDomain(order).toJson());
      return right(unit);
    } on FirebaseException catch (_) {
      return left(const FirestoreFailure.unexpected());
    } catch (_) {
      return left(const FirestoreFailure.serverError());
    }
  }

  @override
  Stream<Either<FirestoreFailure, List<order.Order>>> fetchOrders() async* {
    User? currentUser = _firebaseAuth.currentUser;

    final userDoc = _firebaseFirestore.collection('users').doc(currentUser?.uid);

    yield* userDoc
        .collection('orders')
        .orderBy(
          'serverTimeStamp',
          descending: true,
        )
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return right<FirestoreFailure, List<order.Order>>(<order.Order>[]);
      }
      return right<FirestoreFailure, List<order.Order>>(snapshot.docs
          .map(
            (doc) => OrderDtos.fromJson(doc.data()).toDomain(),
          )
          .toList());
    }).handleError((error) {
      if (error is FirebaseException) {
        return left(const FirestoreFailure.unexpected());
      } else {
        return left(const FirestoreFailure.serverError());
      }
    });
  }
}

import 'package:dartz/dartz.dart';

import '../core/firestore_failures.dart';
import './order.dart' as order;

abstract class IOrderRepository {
  Future<Either<FirestoreFailure, Unit>> saveToServer(order.Order order);
  Stream<Either<FirestoreFailure, List<order.Order>>> fetchOrders();
}

import 'package:dartz/dartz.dart';

import '../cart/cart.dart';
import '../core/firestore_failures.dart';

abstract class ICartHistoryRepo {
  Future<Either<FirestoreFailure, Unit>> addToServer({
    required Cart cart,
  });

  Stream<Either<FirestoreFailure, List<Cart>>> fetchCart();
}

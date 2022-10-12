import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/cart_history/i_cart_history_repo.dart';
import '../../domain/cart/cart.dart';
import '../../domain/core/firestore_failures.dart';

@injectable
class CartHistoryProvider with ChangeNotifier {
  final ICartHistoryRepo _iCartHistoryRepo;
  CartHistoryProvider(this._iCartHistoryRepo);

  Future<Either<FirestoreFailure, Unit>> paymentSuccess({
    required Cart cart,
  }) async {
    final response = await _iCartHistoryRepo.addToServer(cart: cart);
    return response;
    // Either<FirestoreFailure, Unit> either = response.fold(
    //   (failure) => left(failure),
    //   (_) => right(unit),
    // );
    // return either;
  }

  Future<Either<FirestoreFailure, List<Cart>>> fetchFromServer() async {
    Either<FirestoreFailure, List<Cart>> cart = right(<Cart>[]);
    Stream<Either<FirestoreFailure, List<Cart>>> cartStream;
    cartStream = _iCartHistoryRepo.fetchCart();

    Either<FirestoreFailure, List<Cart>> failureOrSuccess;
    await for (failureOrSuccess in cartStream) {
      cart = failureOrSuccess.fold(
        (failure) => left(failure),
        (cart) => right(cart),
      );
      return cart;
    }
    return cart;
  }
}

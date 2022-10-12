import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

import '../../domain/order/i_order_repository.dart';
import '../../domain/order/order.dart' as order;
import '../../domain/core/firestore_failures.dart';
import '../../domain/core/value_object.dart';
import '../../domain/order/value_objects.dart';

@injectable
class OrderProvider with ChangeNotifier {
  final IOrderRepository _iOrderRepository;
  OrderProvider(this._iOrderRepository);

  Future<Either<FirestoreFailure, Unit>> paymentSuccess(
    PaymentSuccessResponse response,
    String cartId,
  ) async {
    final result = await _iOrderRepository.saveToServer(order.Order(
      orderId: OrderId(response.orderId ?? UniqueId.fromUuid().getOrCrash()),
      paymentId: PaymentId(response.paymentId!),
      orderedOn: OrderedOn(DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now())),
      cartId: CartId(cartId),
    ));
    return result;

    // final either = result.fold(
    //   (failure) => left(failure),
    //   (_) => right(unit),
    // );
    //
    // return either as Either<FirestoreFailure, Unit>;
  }

  Future<Either<FirestoreFailure, List<order.Order>>> fetchFromServer() async {
    Either<FirestoreFailure, List<order.Order>> orders = right(<order.Order>[]);
    Stream<Either<FirestoreFailure, List<order.Order>>> orderStream;
    orderStream = _iOrderRepository.fetchOrders();

    Either<FirestoreFailure, List<order.Order>> failureOrSuccess;
    await for (failureOrSuccess in orderStream) {
      orders = failureOrSuccess.fold(
        (failure) => left(failure),
        (orders) => right(orders),
      );
      return orders;
    }
    return orders;
  }
}

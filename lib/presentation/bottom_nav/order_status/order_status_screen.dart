import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:provider/provider.dart';

import '../../../application/auth/auth_provider.dart';
import '../../../application/order/order_provider.dart';
import '../../../domain/core/firestore_failures.dart';
import '../../../domain/order/order.dart' as order;
import '../../core/app_colors.dart';
import '../../core/error_page.dart';
import '../../core/sign_in_instruction.dart';
import './widgets/order_status_screen_widget.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({Key? key}) : super(key: key);

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  bool isInitial = true;
  Future<dartz.Either<FirestoreFailure, List<order.Order>>>? fetchOrders;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInitial) {
      fetchOrders = Provider.of<OrderProvider>(context, listen: false).fetchFromServer();
      isInitial = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Your Orders'),
        ),
        backgroundColor: AppColors.mainColor,
        elevation: 0,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return !authProvider.authState.isAuthenticated
              ? const SignInInstructionScreen(
                  text: 'Sign In To See Your Orders',
                )
              : FutureBuilder(
                  future: fetchOrders,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      dartz.Either<FirestoreFailure, List<order.Order>> orders =
                          snapshot.data as dartz.Either<FirestoreFailure, List<order.Order>>;
                      return orders.fold(
                        (failure) => failure.map(
                          unexpected: (_) => const ErrorPage(
                            errorType: 'An Unexpected Error Occurred.\nPlease Contact Support.',
                          ),
                          serverError: (_) => const ErrorPage(
                            errorType: 'Server Error.\nPlease Try After Sometime.',
                          ),
                        ),
                        (ordersList) => OrderStatusScreenWidget(
                          orders: ordersList,
                        ),
                      );
                    }
                  },
                );
        },
      ),
    );
  }
}

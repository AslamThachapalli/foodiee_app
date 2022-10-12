import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/auth/auth_provider.dart';
import '../../../domain/cart/cart.dart';
import '../../../domain/core/firestore_failures.dart';
import '../../../application/cart_history/cart_history_provider.dart';
import '../../core/app_colors.dart';
import '../../core/error_page.dart';
import '../../core/sign_in_instruction.dart';
import './widgets/cart_history_screen_widget.dart';

class CartHistoryScreen extends StatefulWidget {
  const CartHistoryScreen({Key? key}) : super(key: key);

  @override
  State<CartHistoryScreen> createState() => _CartHistoryScreenState();
}

class _CartHistoryScreenState extends State<CartHistoryScreen> {
  bool isInitial = true;
  Future<dartz.Either<FirestoreFailure, List<Cart>>>? fetchCart;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInitial) {
      fetchCart = Provider.of<CartHistoryProvider>(context, listen: false).fetchFromServer();
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
          child: Text('Your Cart History'),
        ),
        backgroundColor: AppColors.mainColor,
        elevation: 0,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return !authProvider.authState.isAuthenticated
              ? const SignInInstructionScreen(
                  text: 'Sign In To See Your Cart History',
                )
              : FutureBuilder(
                  future: fetchCart,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      dartz.Either<FirestoreFailure, List<Cart>> cart =
                          snapshot.data as dartz.Either<FirestoreFailure, List<Cart>>;
                      return cart.fold(
                        (failure) => failure.map(
                          unexpected: (_) => const ErrorPage(
                            errorType: 'An Unexpected Error Occurred.\nPlease Contact Support.',
                          ),
                          serverError: (_) => const ErrorPage(
                            errorType: 'Server Error.\nPlease Try After Sometime.',
                          ),
                        ),
                        (cartList) => CartHistoryScreenWidget(
                          cart: cartList,
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

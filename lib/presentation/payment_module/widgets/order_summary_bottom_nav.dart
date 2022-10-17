import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../application/cart_history/cart_history_provider.dart';
import '../../../application/order/order_provider.dart';
import '../../../application/user_detail/user_detail_provider.dart';
import '../../../application/cart/cart_provider.dart';
import '../../core/app_colors.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';
import '../../core/small_text.dart';
import '../../routes/route_helper.dart';

class OrderSummaryBottomNav extends StatefulWidget {
  const OrderSummaryBottomNav({Key? key}) : super(key: key);

  @override
  State<OrderSummaryBottomNav> createState() => _OrderSummaryBottomNavState();
}

class _OrderSummaryBottomNavState extends State<OrderSummaryBottomNav> {
  bool isLoading = false;
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckOut({
    required int amount,
    required String contact,
    required String email,
  }) {
    var options = {
      'key': 'TEST_API_KEY',
      'amount': amount,
      'name': 'Foodiee App',
      'description': 'Food at your Fingertip',
      'prefill': {
        'contact': contact,
        'email': email,
      }
    };

    _razorpay.open(options);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.pixels90,
      padding: EdgeInsets.all(Dimensions.pixels20),
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.pixels20),
          topRight: Radius.circular(Dimensions.pixels20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Total payable amount
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.pixels10,
              vertical: Dimensions.pixels15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.pixels20),
              color: Colors.white,
            ),
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, _) => BigText(
                text: '₹ ${cartProvider.cart.amount.getOrCrash() + 30}',
              ),
            ),
          ),

          //Pay now button
          Consumer2<UserDetailProvider, CartProvider>(
            builder: (context, userDetailProvider, cartProvider, child) {
              return GestureDetector(
                  onTap: () async {
                    openCheckOut(
                      amount: cartProvider.cart.amount.getOrCrash().toInt() * 100,
                      contact: userDetailProvider.loggedInUser.phoneNumber.getOrCrash().toString(),
                      email: userDetailProvider.loggedInUser.emailAddress.getOrCrash().toString(),
                    );
                  },
                  child: child);
            },
            child: Container(
              height: Dimensions.pixels45 + Dimensions.pixels5,
              width: Dimensions.pixels90 + Dimensions.pixels5,
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.pixels10,
                vertical: Dimensions.pixels15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.pixels20),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: isLoading
                    ? SizedBox(
                        width: Dimensions.pixels20,
                        child: const CircularProgressIndicator(color: Colors.white),
                      )
                    : SmallText(
                        text: 'Pay Now',
                        color: Colors.white,
                        size: Dimensions.font18,
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    isLoading = true;
    final cart = Provider.of<CartProvider>(context, listen: false).cart;
    final returnValue = await Future.wait([
      Provider.of<CartHistoryProvider>(context, listen: false).paymentSuccess(cart: cart),
      Provider.of<OrderProvider>(context, listen: false).paymentSuccess(
        response,
        cart.cartId.getOrCrash(),
      ),
    ]);
    await Provider.of<CartProvider>(context, listen: false).removeCart();
    returnValue[0].fold(
      (failure) => null,
      (_) => Get.offNamed(RouteHelper.initial),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Get.toNamed(
      RouteHelper.getPaymentFailureScreen(
        response.code?.toString(),
        response.message?.toString(),
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
}

import 'package:foodiee_app/presentation/core/error_page.dart';
import 'package:foodiee_app/presentation/payment_module/payment_failure_screen.dart';
import 'package:foodiee_app/presentation/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../bottom_nav/bottom_nav_screen.dart';
import '../product_detail/pop_product_detail_screen.dart';
import '../product_detail/rec_product_detail_screen.dart';
import '../cart/cart_screen.dart';
import '../auth/auth_screen.dart';
import '../location/map_screen.dart';
import '../location/select_location_screen.dart';
import '../payment_module/order_summary_screen.dart';

class RouteHelper {
  static const String splashScreen = '/splash-screen';
  static const String initial = '/';
  static const String popularFoodDetail = '/popular-food-detail';
  static const String recommendedFoodDetail = '/recommended-food-detail';
  static const String cartScreen = '/cart-screen';
  static const String authScreen = '/auth-screen';
  static const String selectLocationScreen = '/select-location';
  static const String mapScreen = '/map-screen';
  static const String orderSummaryScreen = '/order-summary-screen';
  static const String errorPage = '/error-page';
  static const String paymentFailurePage = '/payment-failure-page';

  static String getPopularFood(int pageId) => '$popularFoodDetail?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFoodDetail?pageId=$pageId';
  static String getCartScreen() => cartScreen;
  static String getAuthScreen() => authScreen;
  static String getSelectLocationScreen() => selectLocationScreen;
  static String getMapScreen() => mapScreen;
  static String getOrderSummaryScreen() => orderSummaryScreen;
  static String getErrorPage(String errorType) => '$errorPage?type=$errorType';
  static String getPaymentFailureScreen(
    String? code,
    String? message,
  ) =>
      '$paymentFailurePage?code=$code?message=$message';

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: initial, page: () => const BottomNavScreen()),
    GetPage(
      name: popularFoodDetail,
      page: () {
        var pageId = Get.parameters['pageId']!;
        return PopProductDetailScreen(index: int.parse(pageId));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFoodDetail,
      page: () {
        var pageId = Get.parameters['pageId']!;
        return RecProductDetailScreen(index: int.parse(pageId));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartScreen,
      page: () => const CartScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: authScreen,
      page: () {
        bool fromCart = Get.arguments;
        return AuthScreen(
          isFromCart: fromCart,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: selectLocationScreen,
      page: () {
        List<dynamic> arguments = Get.arguments as List<dynamic>;
        String userName = arguments[0];
        int phoneNumber = arguments[1];
        bool isPaying = arguments[2];
        bool isFromCart = arguments[3];
        return SelectLocationScreen(
          userName: userName,
          phoneNumber: phoneNumber,
          isPaying: isPaying,
          isFromCart: isFromCart,
        );
      },
    ),
    GetPage(
        name: mapScreen,
        page: () {
          List<dynamic> arguments = Get.arguments as List<dynamic>;
          String key = arguments[0];
          bool fromCart = arguments[1];
          return MapScreen(
            addressKey: key,
            isFromCart: fromCart,
          );
        }),
    GetPage(
      name: orderSummaryScreen,
      page: () {
        return const OrderSummeryScreen();
      },
    ),
    GetPage(
      name: errorPage,
      page: () {
        String errorType = Get.parameters['type']!;
        return ErrorPage(errorType: errorType);
      },
    ),
    GetPage(
        name: paymentFailurePage,
        page: () {
          String? code = Get.parameters['code'];
          String? message = Get.parameters['message'];
          return PaymentFailureScreen(
            code: code,
            message: message,
          );
        }),
  ];
}

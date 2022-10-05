import 'package:get/get.dart';
import 'package:location/location.dart';

import '../bottom_nav/bottom_nav_screen.dart';
import '../product_detail/pop_product_detail_screen.dart';
import '../product_detail/rec_product_detail_screen.dart';
import '../cart/cart_screen.dart';
import '../auth/auth_screen.dart';
import '../location/map_screen.dart';
import '../location/select_location_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFoodDetail = '/popular-food-detail';
  static const String recommendedFoodDetail = '/recommended-food-detail';
  static const String cartScreen = '/cart-screen';
  static const String authScreen = '/auth-screen';
  static const String selectLocationScreen = '/select-location';
  static const String mapScreen = '/map-screen';

  static String getPopularFood(int pageId) => '$popularFoodDetail?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFoodDetail?pageId=$pageId';
  static String getCartScreen() => '$cartScreen';
  static String getAuthScreen() => '$authScreen';
  static String getSelectLocationScreen() => '$selectLocationScreen';
  static String getMapScreen() => '$mapScreen';

  static List<GetPage> routes = [
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
        return SelectLocationScreen(
          userName: userName,
          phoneNumber: phoneNumber,
        );
      },
    ),
    GetPage(
        name: mapScreen,
        page: () {
          List<dynamic> arguments = Get.arguments as List<dynamic>;
          LocationData locationData = arguments[0];
          String key = arguments[1];
          return MapScreen(
            locationData: locationData,
            addressKey: key,
          );
        })
  ];
}

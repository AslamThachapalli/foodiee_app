import 'package:get/get.dart';

import '../bottom_nav/bottom_nav_screen.dart';
import '../product_detail/pop_product_detail_screen.dart';
import '../product_detail/rec_product_detail_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFoodDetail = '/popular-food-detail';
  static const String recommendedFoodDetail = '/recommended-food-detail';

  static String getPopularFood(int pageId) =>
      '$popularFoodDetail?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFoodDetail?pageId=$pageId';

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
  ];
}

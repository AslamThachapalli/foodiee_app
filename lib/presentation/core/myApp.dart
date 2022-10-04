import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../application/cart/cart_provider.dart';
import '../../application/cart/data_persistence_provider.dart';
import '../../application/product_fetching/product_provider.dart';
import '../../application/auth/auth_provider.dart';
import '../../application/navigation_guide/navigation_guide_provider.dart';
import '../../application/user_detail/user_detail_provider.dart';
import '../../application/location/location_provider.dart';
import '../../injection.dart';
import './app_colors.dart';
import '../routes/route_helper.dart';

import '../bottom_nav/bottom_nav_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getIt<ProductProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<AuthProvider>()..authCheckRequested(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<DataPersistenceProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<CartProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<NavigationGuideProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<UserDetailProvider>(),
        ),
        ChangeNotifierProxyProvider<UserDetailProvider, LocationProvider>(
          create: (context) => getIt<LocationProvider>(),
          update: (_, userDetailProvider, locationProvider) =>
              getIt<LocationProvider>()..update(userDetailProvider.address),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodiee_app',
        theme: ThemeData.light().copyWith(
          colorScheme: ThemeData.light().colorScheme.copyWith(
                secondary: AppColors.mainColor,
                onSecondary: Colors.white,
              ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
            selectedItemColor: AppColors.mainColor,
            unselectedItemColor: Colors.grey[600],
            elevation: 5,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: AppColors.mainColor,
            ),
          ),
        ),
        home: const BottomNavScreen(),
        initialRoute: RouteHelper.initial,
        getPages: RouteHelper.routes,
      ),
    );
  }
}
// 0xFF69F0AE

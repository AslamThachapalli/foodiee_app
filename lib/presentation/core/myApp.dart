import 'package:flutter/material.dart';
import 'package:foodiee_app/injection.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../application/product_fetching/product_provider.dart';
import '../../application/auth/auth_provider.dart';
import './app_colors.dart';

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
          create: (context) => getIt<AuthProvider>(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodiee_app',
        home: BottomNavScreen(),
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
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: AppColors.mainColor,
              ),
            )),
      ),
    );
  }
}
// 0xFF69F0AE

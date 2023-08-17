import 'package:flutter/material.dart';
import 'package:test_project/ui/splash/splash_screen.dart';
import 'package:test_project/utils/colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: AppColors.pdpMain,
        scaffoldBackgroundColor: AppColors.pdpMain,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.pdpMain
            // elevation: 0,
            ),
      ),
    ),
  );
}

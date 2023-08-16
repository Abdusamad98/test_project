import 'package:flutter/material.dart';
import 'package:test_project/ui/splash/splash_screen.dart';
import 'package:test_project/utils/colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.pdpMain,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.pdpMain)),
      home: SplashScreen(),
    ),
  );
}

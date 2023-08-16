import 'package:flutter/material.dart';
import 'package:test_project/ui/splash/splash_screen.dart';
import 'package:test_project/utils/colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.pdpMain
      ),
    ),
  );
}

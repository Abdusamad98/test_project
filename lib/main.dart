import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/ui/introduction_screen.dart';
import 'package:test_project/utils/app_colors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const IntroductionScreen(),
    theme: ThemeData(
      scaffoldBackgroundColor: AppColors.C_273032,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.C_273032
        ),
        backgroundColor: AppColors.C_273032,
        elevation: 0,
      ),
    ),
  ));
}

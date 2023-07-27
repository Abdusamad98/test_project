import 'package:flutter/material.dart';
import 'package:test_project/ui/introduction_screen.dart';
import 'package:test_project/utils/colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroductionScreen(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.C_273032),
          scaffoldBackgroundColor: AppColors.C_273032),
    ),
  );
}

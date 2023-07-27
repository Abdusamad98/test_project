import 'package:flutter/material.dart';
import 'package:test_project/ui/introduction_screen.dart';
import 'package:test_project/utils/colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.C_273032,
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.C_273032)),
      home: IntroductionScreen(),
    ),
  );

  List<int> numbers = [
    12,
    33,
    56,
  ];
  numbers.length;
}

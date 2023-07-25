import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/ui/introduction/introduction_screen.dart';
import 'package:test_project/utils/colors.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroductionScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.C_273032,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.C_273032,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.C_273032,
            statusBarIconBrightness: Brightness.light,
          )
        )
      ),
    ),
  );
}

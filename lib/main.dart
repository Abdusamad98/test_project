import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/ui/intrdoction_screen.dart';

main() {
  runApp(
    MaterialApp(
      home: IntroductionScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0XFF273032),
        ),
        scaffoldBackgroundColor: Color(0XFF273032)
      ),
    ),
  );
}

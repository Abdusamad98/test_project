import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/ui/intrdoction_screen.dart';

main() {
  runApp(
    MaterialApp(
      home: const IntroductionScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0XFF273032),
          ),
          scaffoldBackgroundColor: const Color(0XFF273032)),
    ),
  );
}

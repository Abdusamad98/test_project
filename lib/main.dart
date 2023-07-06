import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/introduction_screen.dart';
import 'package:test_project/login_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:IntroductionScreen(),
  ));
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'introduction_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionScreen(),
    ),
  );
}

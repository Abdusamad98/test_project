import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF1F5460),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF1F5460),
      ),
      backgroundColor: const Color(0xFF1F5460),
    ),
  ));
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Spedah",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF1F5460),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF1F5460),
      ),
      backgroundColor: const Color(0xFF1F5460),
      body: Column(
        children: [

        ],
      ),
    ),
  ));
}

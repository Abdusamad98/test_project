import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1F5460),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xFF1F5460),
          ),
          title: const Text("Spedah"),
        ),
        backgroundColor: const Color(0xFF1F5460),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  left: 150,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFD5E7D4)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/images/bicycle.png",
                      height: 350,
                    )
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 28),
              child: Text(
                "Let’s\nget started",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.only(left: 28),
              child: Text(
                "Everything starts from here",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 28),
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFFFCA42),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  "LogIn",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 28),
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFD5E7D4),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

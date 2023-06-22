import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF1F5460),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1F5460),
          title: const Text(
            "Spedah",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                "assets/images/bicycle.png",
                height: 300,
              ),
              const Row(
                children: [
                  SizedBox(width: 28),
                  Text(
                    "Let's\n get started",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

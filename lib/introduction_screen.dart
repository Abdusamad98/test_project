import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/login_screen.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              "assets/images/bicycle.png",
              height: 300,
            ),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Let's\nget started",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Everything start from here",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 28),
                decoration: BoxDecoration(
                    color: const Color(0xFFFFCA42),
                    borderRadius: BorderRadius.circular(100)),
                child: const Center(
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 28),
              decoration: BoxDecoration(
                  color: const Color(0xFFD5E7D4),
                  borderRadius: BorderRadius.circular(100)),
              child: const Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

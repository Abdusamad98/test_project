import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF1F5460),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1F5460),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF1F5460),
        ),
        title: Text(
          "Spedah",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24,
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
            Row(
              children: [
                SizedBox(width: 28),
                Text(
                  "Let’s\nget started",
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                SizedBox(width: 28),
                Text(
                  "Everything start from here",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            SizedBox(height: 36),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 28),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFFFCA42),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text(
                  "Log in",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 28),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFD5E7D4),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
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

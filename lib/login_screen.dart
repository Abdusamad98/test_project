import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1F5460),
          ),
        ),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(""),
      ),
      body: Padding(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome back",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F5460),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Enter your credential to continue",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF879EA4),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                hintText: "Email or username",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Color(0xFF1F5460).withOpacity(0.2))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.teal)),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.remove_red_eye),
                hintText: "Password",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Color(0xFF1F5460).withOpacity(0.2))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.teal)),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1F5460),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              height: 50,
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
            const SizedBox(height: 16),
            getButtonWidget(
              "Log in using Apple",
              "assets/images/apple.png",
              Colors.black,
              Colors.white,
              () {
                print("1 BUTTON TAPPED");
              },
            ),
            const SizedBox(height: 16),
            getButtonWidget(
              "Log in using Google",
              "assets/images/google.png",
              Color(0xFFF0F5F2),
              Color(0xFF10405A),
              () {
                print("2 BUTTON TAPPED");
              },
            ),
            const Expanded(child: SizedBox()),
            const Center(
              child: Text(
                "Don’t have account? Sign up",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1F5460),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getButtonWidget(
    String buttonText,
    String iconPath,
    Color buttonColor,
    Color textColor,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 23,
              height: 23,
            ),
            const SizedBox(width: 10),
            Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

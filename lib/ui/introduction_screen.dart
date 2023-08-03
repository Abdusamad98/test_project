import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:test_project/ui/subjetcs_screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return SubjectScreen();
      }));
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(
            child: Text(
              "Quiz App with 106",
              style: GoogleFonts.oswald(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.teal,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Lottie.asset("assets/lotties/introduction.json"),
        ],
      ),
    );
  }
}

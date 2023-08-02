import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:test_project/ui/subjects/subjects_screen.dart';
import 'package:test_project/utils/colors.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 3));

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SubjectsScreen();
          },
        ),
      );
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
      backgroundColor: AppColors.C_273032,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Text(
                "Welcome to Test App with 105",
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
          ),
          Lottie.asset("assets/lotties/introduction.json")
        ],
      ),
    );
  }
}

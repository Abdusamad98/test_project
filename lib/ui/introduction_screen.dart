import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_project/ui/subjects_screen.dart';

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
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Text(
            //   "Quiz App With 107",
            //   style: TextStyle(
            //     fontSize: 32,
            //     color: Colors.white,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
            Lottie.asset('assets/lotties/introduction.json'),
          ],
        ));
  }
}

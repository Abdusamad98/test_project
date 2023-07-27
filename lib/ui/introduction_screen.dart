import 'package:flutter/material.dart';
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
    return const Scaffold(
      body: Center(child: Text(
        "Quiz App with 106",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.white
        ),
      ),),
    );
  }
}

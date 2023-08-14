import 'package:flutter/material.dart';
import 'package:test_project/ui/tab/tab_box.dart';
import 'package:test_project/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TabBox();
        },
      ),
    );
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Introduction Screen",
          style: TextStyle(color: AppColors.white, fontSize: 32),
        ),
      ),
    );
  }
}

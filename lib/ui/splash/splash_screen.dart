import 'package:flutter/material.dart';
import 'package:test_project/ui/tab_box.dart';
import 'package:test_project/utils/colors.dart';
import 'package:test_project/utils/icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      height = MediaQuery.of(context).size.height / 3;
    });
    await Future.delayed(const Duration(milliseconds: 2500));

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return TabBox();
          },
        ),
      );
    }
  }

  double height = 100.0;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          height: height,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Image.asset(AppIcons.logo),
          ),
        ),
      ),
    );
  }
}

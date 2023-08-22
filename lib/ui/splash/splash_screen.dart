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
    await Future.delayed(Duration(seconds: 3));
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

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: AppColors.white),
          child: Image.asset(AppIcons.logo),
        ),
      ),
    );
  }
}

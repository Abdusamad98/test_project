import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_project/ui/tab/tab_box.dart';
import 'package:test_project/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  _init() async {
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

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    _init();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation = Tween<double>(begin: 0, end: 2 * pi).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
      reverseCurve: Curves.easeOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
    animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Center(
            child: Transform.rotate(
              angle: animation.value,
              child: Image.asset(AppImages.image2),
            ),
          ),
        ),
      ),
    );
  }
}

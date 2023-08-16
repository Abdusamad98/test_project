import 'package:flutter/material.dart';
import 'package:test_project/utils/colors.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "University courses",
          style: TextStyle(
            fontSize: 22,
            color: AppColors.white,
          ),
        ),
      ),
    );
    ;
  }
}

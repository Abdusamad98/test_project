import 'package:flutter/material.dart';
import 'package:test_project/data/app_database.dart';
import 'package:test_project/utils/colors.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    debugPrint("CURRENT SCREEN HEIGHT:$height and WIDTH:$width");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: width > 500 ? 3 : 2,
        childAspectRatio: 0.6,
        children: <Widget>[
          for (int i = 0; i < courses.length; i++)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: courses[i].color,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      courses[i].imagePath,
                      height: height / 6,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    courses[i].courseName,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    courses[i].requiredKnowledge,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    courses[i].durationOfCourse,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
      ),
      body: GridView.count(
        // scrollDirection: Axis.horizontal,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: 0.65,
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
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 6,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    courses[i].courseName,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    courses[i].requiredKnowledge,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    courses[i].durationOfCourse,
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
    ;
  }
}

import 'package:flutter/material.dart';
import 'package:test_project/models/app_database.dart';
import 'package:test_project/ui/tab/courses/course_detail_screen.dart';
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
        title: const Text("Available Courses "),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        children: <Widget>[
          for (int index = 0; index < courses.length; index++)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CourseDetailScreen(courseModel: courses[index]);
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: courses[index].color),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        courses[index].imagePath,
                        height: MediaQuery.of(context).size.height / 5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      courses[index].courseName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      courses[index].durationOfCourse,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

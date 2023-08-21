import 'package:flutter/material.dart';
import 'package:test_project/data/app_database.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Courses"),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        children: <Widget>[
          for (int i = 0; i < AppDatabase.courses.length; i++)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CourseDetailScreen(
                          courseModel: AppDatabase.courses[i]);
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppDatabase.courses[i].color),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        AppDatabase.courses[i].imagePath,
                        height: MediaQuery.of(context).size.height / 6,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      AppDatabase.courses[i].courseName,
                      style:
                          const TextStyle(color: AppColors.white, fontSize: 16),
                    ),
                    const Spacer(),
                    Text(
                      AppDatabase.courses[i].durationOfCourse,
                      style: const TextStyle(color: Colors.yellow),
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

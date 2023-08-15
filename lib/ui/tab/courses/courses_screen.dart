import 'package:flutter/material.dart';
import 'package:test_project/data/app_database.dart';
import 'package:test_project/models/course_model.dart';
import 'package:test_project/ui/tab/courses/course_detail_screen.dart';
import 'package:test_project/ui/tab/courses/widgets/course_item.dart';

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
        primary: false,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: .75,
        children: <Widget>[
          ...List.generate(
            AppDatabase.courses.length,
            (index) {
              CourseModel courseModel = AppDatabase.courses[index];
              return CourseItem(
                courseModel: courseModel,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CourseDetailScreen(courseModel: courseModel);
                      },
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

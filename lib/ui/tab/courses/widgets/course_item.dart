import 'package:flutter/material.dart';
import 'package:test_project/models/course_model.dart';
import 'package:test_project/utils/colors.dart';

class CourseItem extends StatelessWidget {
  CourseItem({
    super.key,
    required this.courseModel,
    required this.onTap,
  });

  CourseModel courseModel;

  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: courseModel.color),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                courseModel.imagePath,
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 2 - 32,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 12),
            Text(courseModel.courseName,
                style: const TextStyle(color: AppColors.white, fontSize: 18)),
            const Spacer(),
            Text(courseModel.durationOfCourse,
                style: const TextStyle(color: Colors.yellowAccent, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

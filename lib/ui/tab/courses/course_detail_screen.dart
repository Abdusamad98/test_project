import 'package:flutter/material.dart';
import 'package:test_project/models/course_model.dart';
import 'package:test_project/utils/colors.dart';
import 'package:test_project/utils/content.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseModel.courseName),
      ),
      body: ListView(
        children: [
          Image.asset(courseModel.imagePath),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Requirements",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.pdpSecondary,
                  ),
                ),
                Text(
                  courseModel.requiredKnowledge,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Duration of the course",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.pdpSecondary,
                  ),
                ),
                Text(
                  courseModel.durationOfCourse,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              courseModel.description,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            height: 50,
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50), // <-- Radius
                  ),
                  backgroundColor: AppColors.pdpSecondary),
              onPressed: () async {
                await launchUrl(Uri.parse(AppContents.pdpCourses));
              },
              child: const Text(
                "ENROLL THE COURSE",
                style: TextStyle(fontSize: 18, color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

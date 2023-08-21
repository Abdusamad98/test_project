import 'package:flutter/material.dart';
import 'package:test_project/models/course_model.dart';
import 'package:test_project/utils/colors.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Requirements: ",
                  style: TextStyle(
                    color: AppColors.pdpSecondary,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    courseModel.requiredKnowledge,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Duration: ",
                  style: TextStyle(
                    color: AppColors.pdpSecondary,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    courseModel.durationOfCourse,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              courseModel.description,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            height: 40,
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: AppColors.pdpSecondary),
              child: const Text(
                "ENROLL THE COURSE",
                style: TextStyle(color: AppColors.white),
              ),
              onPressed: () async {
                launchUrl(Uri.parse("https://online.pdp.uz/"));
              },
            ),
          )
        ],
      ),
    );
  }
}

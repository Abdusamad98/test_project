import 'package:flutter/material.dart';

class CourseModel {
  final String courseName;

  final String imagePath;

  final String description;

  final String durationOfCourse;

  final String requiredKnowledge;

  final Color color;

  CourseModel({
    required this.description,
    required this.imagePath,
    required this.courseName,
    required this.durationOfCourse,
    required this.requiredKnowledge,
    required this.color,
  });
}

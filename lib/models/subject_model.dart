import 'package:flutter/material.dart';
import 'package:test_project/models/question_model.dart';

class SubjectModel {
  SubjectModel({
    required this.iconPath,
    required this.questions,
    required this.subjectName,
    required this.color,
  });

  final String subjectName;
  final String iconPath;
  final Color color;
  final List<QuestionModel> questions;
}

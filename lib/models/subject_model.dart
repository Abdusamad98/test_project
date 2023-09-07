import 'package:flutter/material.dart';
import 'package:test_project/models/question_model.dart';

class SubjectModel {
  int? id;
  final String subjectName;
  final String iconPath;
  final Color color;
  final String resultKey;
  final String timeKey;
  final List<QuestionModel> questions;

  SubjectModel({
    required this.iconPath,
    required this.color,
    required this.questions,
    required this.subjectName,
    required this.resultKey,
    required this.timeKey,
  });
}

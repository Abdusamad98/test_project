import 'package:flutter/material.dart';
import 'package:test_project/models/question_model.dart';

class SubjectModel {
  SubjectModel({
    required this.color,
    required this.subjectName,
    required this.questions,
    required this.iconPath,
  });

  final String subjectName;
  final String iconPath;
  final List<QuestionModel> questions;
  final Color color;




}


// "id": 1,
// "name": "Math",
// "iconPath": "example.com",
// "color": "333"
// },
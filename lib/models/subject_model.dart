import 'dart:ui';

import 'package:test_project/models/question_model.dart';

class SubjectModel {
  SubjectModel({
    required this.iconPath,
    required this.subjectName,
    required this.questions,
    required this.color,
    this.id,
  });

  String? id;
  final String subjectName;
  final String iconPath;
  final List<QuestionModel> questions;
  final Color color;
}

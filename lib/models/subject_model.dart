import 'dart:ui';

import 'package:test_project/models/question_model.dart';

class SubjectModel {
  int? id;
  final String subjectName;
  final String iconPath;
  final Color color;
  final List<QuestionModel> questions;


  SubjectModel(
      {required this.iconPath,
      required this.color,
      required this.questions,
      required this.subjectName});
}

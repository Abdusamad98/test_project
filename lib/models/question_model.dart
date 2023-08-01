import 'package:test_project/models/question_level.dart';

class QuestionModel {
  QuestionModel({
    required this.trueAnswer,
    required this.answer4,
    required this.answer3,
    required this.answer2,
    required this.answer1,
    required this.questionText,
    this.id,
    this.level = QuestionLevel.easy,
  });

  String? id;
  final String questionText;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final int trueAnswer;
  final QuestionLevel level;
}

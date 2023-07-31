import 'package:test_project/models/question_level.dart';

class QuestionModel {
  int? id;
  final String questionText;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final int trueAnswer;
  final QuestionLevel level;

  QuestionModel({
    required this.questionText,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.level,
    required this.trueAnswer,
  });
}
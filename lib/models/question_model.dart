import 'package:test_project/models/question_level.dart';

class QuestionModel {
  QuestionModel({
    this.id,
    this.questionLevel = QuestionLevel.easy,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.questionText,
    required this.trueAnswer,
  });

  int? id;
  final String questionText;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final String trueAnswer;
  final QuestionLevel questionLevel;
}

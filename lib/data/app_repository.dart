import 'package:flutter/material.dart';
import 'package:test_project/models/question_level.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';

class AppRepository {
  static List<SubjectModel> subjects = [
    SubjectModel(
      color: Colors.teal,
      subjectName: "Math",
      questions: [
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: "100",
          questionText: "5 x 20 = ?",
          answer4: "70",
          answer3: "80",
          answer2: "90",
          answer1: "100",
        ),
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: "20",
          questionText: "100 / 5 = ?",
          answer4: "30",
          answer3: "20",
          answer2: "15",
          answer1: "12",
        ),
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: "5",
          questionText: "100 / 20 = ?",
          answer4: "5",
          answer3: "10",
          answer2: "8",
          answer1: "7",
        ),
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: "12",
          questionText: "6 x 2 = ?",
          answer4: "13",
          answer3: "12",
          answer2: "10",
          answer1: "7",
        ),
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: "30",
          questionText: "3 x 10 = ?",
          answer4: "30",
          answer3: "13",
          answer2: "31",
          answer1: "17",
        ),
      ],
      iconPath: "assets/images/math.png",
    ),
    SubjectModel(
      color: Colors.red,
      subjectName: "English",
      questions: [
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: "a",
          questionText: "I am ... student",
          answer4: "an",
          answer3: "the",
          answer2: "a",
          answer1: "am",
        ),
      ],
      iconPath: "assets/images/english.png",
    ),
  ];
}

List<int> numbers = [
  12,
  34,
  55,
];

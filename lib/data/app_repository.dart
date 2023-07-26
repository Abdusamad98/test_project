import 'package:flutter/material.dart';
import 'package:test_project/models/question_level.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';

class AppRepository {
  static List<SubjectModel> subjects = [
    SubjectModel(
      iconPath: "assets/images/math.png",
      questions: [
        QuestionModel(
          answer1: "100",
          answer2: "300",
          answer3: "360",
          answer4: "240",
          questionText: "120 x 3 = ?",
          trueAnswer: "360",
          questionLevel: QuestionLevel.medium,
        ),
        QuestionModel(
          answer1: "100",
          answer2: "300",
          answer3: "360",
          answer4: "240",
          questionText: "100 x 3 = ?",
          trueAnswer: "300",
          questionLevel: QuestionLevel.easy,
        )
      ],
      subjectName: "Math",
      color: Colors.teal,
    ),
    SubjectModel(
      iconPath: "assets/images/english.png",
      questions: [
        QuestionModel(
          answer1: "100",
          answer2: "300",
          answer3: "360",
          answer4: "240",
          questionText: "120 x 3 = ?",
          trueAnswer: "360",
          questionLevel: QuestionLevel.medium,
        ),
        QuestionModel(
          answer1: "100",
          answer2: "300",
          answer3: "360",
          answer4: "240",
          questionText: "100 x 3 = ?",
          trueAnswer: "300",
          questionLevel: QuestionLevel.easy,
        )
      ],
      subjectName: "Math",
      color: Colors.teal,
    ),
  ];

  List<int> numbers = [
    12,
    34,
    56,
  ];
}

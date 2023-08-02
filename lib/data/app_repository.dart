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
          trueAnswer: 3,
          questionLevel: QuestionLevel.medium,
        ),
        QuestionModel(
          answer1: "100",
          answer2: "300",
          answer3: "360",
          answer4: "240",
          questionText: "100 x 3 = ?",
          trueAnswer: 2,
          questionLevel: QuestionLevel.easy,
        ),
        QuestionModel(
          answer1: "20",
          answer2: "30",
          answer3: "40",
          answer4: "50",
          questionText: "100 / 5 = ?",
          trueAnswer: 1,
          questionLevel: QuestionLevel.medium,
        ),
      ],
      subjectName: "Math",
      color: Colors.teal,
    ),
    SubjectModel(
      iconPath: "assets/images/english.png",
      questions: [
        QuestionModel(
          answer1: "an",
          answer2: "is",
          answer3: "am",
          answer4: "are",
          questionText: "Who ... you ? ",
          trueAnswer: 4,
          questionLevel: QuestionLevel.medium,
        ),
        QuestionModel(
          answer1: "an",
          answer2: "a",
          answer3: "are",
          answer4: "am",
          questionText: "I am ... student",
          trueAnswer:2,
          questionLevel: QuestionLevel.easy,
        )
      ],
      subjectName: "English",
      color: Colors.red,
    ),



  ];
}

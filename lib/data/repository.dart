import 'package:flutter/material.dart';
import 'package:test_project/models/question_level.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';

class AppRepository {
  static List<SubjectModel> subjects = [
    SubjectModel(
      subjectName: "Math",
      iconPath: "assets/images/math.png",
      color: Colors.teal,
      questions: [
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: 1,
          questionText: "5 x 20 = ?",
          answer4: "70",
          answer3: "80",
          answer2: "90",
          answer1: "100",
        ),
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: 3,
          questionText: "100 / 5 = ?",
          answer4: "30",
          answer3: "20",
          answer2: "15",
          answer1: "12",
        ),
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: 4,
          questionText: "100 / 20 = ?",
          answer4: "5",
          answer3: "10",
          answer2: "8",
          answer1: "7",
        ),
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: 3,
          questionText: "6 x 2 = ?",
          answer4: "13",
          answer3: "12",
          answer2: "10",
          answer1: "7",
        ),
        QuestionModel(
          trueAnswer: 2,
          answer4: "bnsdfbd ffsg",
          answer3: "gffdgd fgddg ",
          answer2: "Correct answer",
          answer1: " fgdg  fgdfg",
          questionText: "What is real numbers ?",
        ),
      ],
    ),
    SubjectModel(
      subjectName: "English",
      iconPath: "assets/images/english.png",
      color: Colors.indigo,
      questions: [
        QuestionModel(
          trueAnswer: 4,
          answer4: "a",
          answer3: "am",
          answer2: "an",
          answer1: "the",
          questionText: "I am ... student",
        ),
      ],
    )
  ];
}

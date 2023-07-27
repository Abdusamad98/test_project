import 'package:flutter/material.dart';
import 'package:test_project/models/question_level.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';

class AppRepository {
  static List<SubjectModel> subjects = [
    SubjectModel(
      iconPath: "assets/images/math.png",
      color: Colors.teal,
      questions: [
        QuestionModel(
          questionText: "2+2",
          answer1: "1",
          answer2: "2",
          answer3: "3",
          answer4: "4",
          level: QuestionLevel.medium,
          trueAnswer: "4",
        ),
        QuestionModel(
          questionText: "1+2",
          answer1: "1",
          answer2: "2",
          answer3: "3",
          answer4: "4",
          level: QuestionLevel.easy,
          trueAnswer: "3",
        )
      ],
      subjectName: "Math",
    ),
    SubjectModel(
      iconPath: "assets/images/english.png",
      color: Colors.red,
      questions: [
        QuestionModel(
          questionText: "I am ... student.",
          answer1: "an",
          answer2: "a",
          answer3: "the",
          answer4: "am",
          level: QuestionLevel.easy,
          trueAnswer: "a",
        ),
        QuestionModel(
          questionText: "I am ... student.",
          answer1: "an",
          answer2: "a",
          answer3: "the",
          answer4: "am",
          level: QuestionLevel.easy,
          trueAnswer: "a",
        )
      ],
      subjectName: "English",
    ),
  ];



}

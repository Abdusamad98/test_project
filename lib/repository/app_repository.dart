import 'package:flutter/material.dart';
import 'package:test_project/models/question_level.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';

class AppRepository {
  static List<SubjectModel> subjects = [
    SubjectModel(
      resultKey: "math_result",
      timeKey: "math_time",
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
          level: QuestionLevel.easy,
          trueAnswer: 4,
          questionText: "3 x 10 = ?",
          answer4: "30",
          answer3: "13",
          answer2: "31",
          answer1: "17",
        ),
      ],
      subjectName: "Math",
    ),
    SubjectModel(
      resultKey: "english_result",
      timeKey: "english_time",
      iconPath: "assets/images/english.png",
      color: Colors.red,
      questions: [
        QuestionModel(
          questionText: "I am ... student.weded",
          answer1: "an",
          answer2: "a",
          answer3: "the",
          answer4: "am",
          level: QuestionLevel.easy,
          trueAnswer: 2,
        ),
        QuestionModel(
          questionText: "I am ... student.",
          answer1: "an",
          answer2: "a",
          answer3: "the",
          answer4: "am",
          level: QuestionLevel.easy,
          trueAnswer: 2,
        )
      ],
      subjectName: "English",
    ),
  ];



}

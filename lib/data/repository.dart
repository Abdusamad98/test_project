import 'package:flutter/material.dart';
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
          trueAnswer: "369",
          answer4: "234",
          answer3: "369",
          answer2: "344",
          answer1: "678",
          questionText: "123*3 = ?",
        ),
        QuestionModel(
          trueAnswer: "Correct answer",
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
          trueAnswer: "a",
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

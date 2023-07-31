import 'package:flutter/material.dart';
import 'package:test_project/models/question_level.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';
import 'package:test_project/utils/colors.dart';

class SubjectsRepository {
  static List<SubjectModel> allSubjects = [
    SubjectModel(
      iconPath: "assets/images/math.png",
      color: AppColors.C_27AE60,
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
      iconPath: "assets/images/english.png",
      color: Colors.red,
      questions: [
        QuestionModel(
          questionText: "How many letters in english Alphabet?",
          answer1: "23",
          answer2: "24",
          answer3: "26",
          answer4: "25",
          level: QuestionLevel.easy,
          trueAnswer: 3,
        ),
        QuestionModel(
          questionText: "I ... a student.",
          answer1: "a",
          answer2: "am",
          answer3: "is",
          answer4: "are",
          level: QuestionLevel.medium,
          trueAnswer: 2,
        )
      ],
      subjectName: "English",
    ),
    SubjectModel(
      iconPath: "assets/images/physics.png",
      color: AppColors.C_40D7DD,
      questions: [
        QuestionModel(
          questionText: "What is gravitation?",
          answer1: "gravitation is sdd",
          answer2: "gravitation ",
          answer3: "gravitation rfgbff",
          answer4: "gravitationfgf",
          level: QuestionLevel.easy,
          trueAnswer: 4,
        ),
      ],
      subjectName: "Physics",
    ),
  ];
}

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
          questionText: "2+2",
          answer1: "1",
          answer2: "2",
          answer3: "3",
          answer4: "4",
          level: QuestionLevel.easy,
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
      color: AppColors.C_F2954D,
      questions: [
        QuestionModel(
          questionText: "How many letters in english Alphabet?",
          answer1: "23",
          answer2: "24",
          answer3: "26",
          answer4: "25",
          level: QuestionLevel.easy,
          trueAnswer: "26",
        ),
        QuestionModel(
          questionText: "I ... a student.",
          answer1: "a",
          answer2: "am",
          answer3: "is",
          answer4: "are",
          level: QuestionLevel.medium,
          trueAnswer: "am",
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
          trueAnswer: "gravitationfgf",
        ),
      ],
      subjectName: "Physics",
    ),
  ];
}

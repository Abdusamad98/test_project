import 'package:test_project/models/question_level.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';

class AppRepository {
  static List<SubjectModel> subjects = [
    SubjectModel(
      iconPath: "assets/images/math.png",
      colorInString: "0xFF000000",
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
  ];
}

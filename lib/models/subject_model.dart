import 'package:test_project/models/question_model.dart';

class SubjectModel {
  int? id;
  final String subjectName;
  final String iconPath;
  final String colorInString;
  final List<QuestionModel> questions;

  SubjectModel(
      {required this.iconPath,
      required this.colorInString,
      required this.questions,
      required this.subjectName});
}

import 'package:flutter/material.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';
import 'package:test_project/ui/widgets/question_text_view.dart';
import 'package:test_project/utils/colors.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.subjectModel});

  final SubjectModel subjectModel;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuestionModel> questions = [];

  int currentQuestionIndex = 0;

  @override
  void initState() {
    questions = widget.subjectModel.questions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz from ${widget.subjectModel.subjectName}"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          QuestionTextView(
            questionText: questions[currentQuestionIndex].questionText,
            currentQuestionIndex: currentQuestionIndex,
          ),
        ],
      ),
    );
  }
}

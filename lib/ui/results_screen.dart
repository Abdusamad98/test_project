import 'package:flutter/material.dart';
import 'package:test_project/models/subject_model.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.subject, required this.selectedAnswers});

  final SubjectModel subject;
  final Map<int, int> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    int calculateTrueAnswersCount() {
      int trueAnswerCount = 0;
      for (int i = 0; i < subject.questions.length; i++) {
        if (subject.questions[i].trueAnswer == selectedAnswers[i]) {
          trueAnswerCount++;
        }
      }
      return trueAnswerCount;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Results form ${subject.subjectName}"),
      ),
      body: Center(
        child: Text(
          "Your results: ${calculateTrueAnswersCount()}/${subject.questions.length}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

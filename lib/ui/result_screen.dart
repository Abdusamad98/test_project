import 'package:flutter/material.dart';
import 'package:test_project/models/subject_model.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.subject, required this.selectedAnswers});

  final SubjectModel subject;
  final List<int> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    int calculateTrueAnswersCount() {
      int trueCount = 0;

      for (int i = 0; i < subject.questions.length; i++) {
        if (subject.questions[i].trueAnswer == selectedAnswers[i]) {
          trueCount++;
        }
      }

      return trueCount;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Results from ${subject.subjectName}"),
      ),
      body: Center(
        child: Text(
            "Results: ${calculateTrueAnswersCount()} / ${subject.questions.length} ",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 32
            ),
        ),
      ),
    );
  }
}

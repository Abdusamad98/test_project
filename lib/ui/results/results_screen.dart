import 'package:flutter/material.dart';
import 'package:test_project/models/subject_model.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.subject,
    required this.selectedAnswers,
  });

  final SubjectModel subject;
  final Map<int, int> selectedAnswers;

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
        title: const Text("Your Result"),
      ),
      body: Center(
        child: Text(
          "Your score:  ${calculateTrueAnswersCount()} / ${subject.questions.length}",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

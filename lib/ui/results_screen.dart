import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

    double percentage =
        (calculateTrueAnswersCount() * 100) / subject.questions.length;

    return Scaffold(
        appBar: AppBar(
          title: Text("Results form ${subject.subjectName} $percentage"),
        ),
        body: Column(
          children: [

            if (percentage >= 0 && percentage <= 56)
              Lottie.asset("assets/lotties/bad_score.json"),

            if (percentage > 56 && percentage <= 80)
              Lottie.asset("assets/lotties/average_score.json"),

            if (percentage > 80) Lottie.asset("assets/lotties/best_score.json"),

            Center(
              child: Text(
                "Your results: ${calculateTrueAnswersCount()}/${subject.questions.length}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ));
  }
}

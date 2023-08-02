import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_project/models/subject_model.dart';
import 'dart:io';

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

    double percentage =
        (100 * calculateTrueAnswersCount()) / selectedAnswers.length;

    return Scaffold(
        appBar: AppBar(
          title: Text("Results from ${subject.subjectName}"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (percentage >= 0 && percentage <= 56)
              Lottie.asset("assets/lotties/bad_score.json"),
            if (percentage > 56 && percentage <= 80)
              Lottie.asset("assets/lotties/average_score.json"),
            if (percentage > 80) Lottie.asset("assets/lotties/good_score.json"),
            Text(
              "Results: ${calculateTrueAnswersCount()} / ${subject.questions.length} ",
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 32),
            ),
            Platform.isIOS ? SizedBox(height: 80) : SizedBox()
          ],
        ));
  }
}

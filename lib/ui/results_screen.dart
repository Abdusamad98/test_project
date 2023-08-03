import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_project/models/question_model.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.questions, required this.selectedAnswers});

  final List<QuestionModel> questions;
  final Map<int, int> selectedAnswers;

  int calculateTrueAnswersCount() {
    int trueCount = 0;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].trueAnswer == selectedAnswers[i]) {
        trueCount++;
      }
    }
    return trueCount;
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (100 * calculateTrueAnswersCount()) / questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text("Results $percentage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          if (percentage >= 0 && percentage <= 56)
            Lottie.asset("assets/lotties/bad_score.json"),

          if (percentage > 56 && percentage <= 80)
            Lottie.asset("assets/lotties/average_score.json"),

          if (percentage > 80)
            Lottie.asset("assets/lotties/best_score.json"),


          Center(
            child: Text(
              "Results: ${calculateTrueAnswersCount()}/ ${questions.length}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

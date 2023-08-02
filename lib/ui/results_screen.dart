import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_project/models/question_model.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.allQuestions,
    required this.selectedAnswersOrder,
  });

  final List<QuestionModel> allQuestions;
  final List<int> selectedAnswersOrder;

  int calculateTrueAnswersCount() {
    int trueCount = 0;

    for (int i = 0; i < allQuestions.length; i++) {
      if (allQuestions[i].trueAnswer == selectedAnswersOrder[i]) {
        trueCount++;
      }
    }

    return trueCount;
  }

  @override
  Widget build(BuildContext context) {
    double percentage =
        (100 * calculateTrueAnswersCount()) / allQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
      ),
      body: Column(
        children: [
          if (percentage >= 0 && percentage <= 56)
            Lottie.asset("assets/lotties/bad_score.json"),
          if (percentage > 56 && percentage <= 80)
            Lottie.asset("assets/lotties/average_score.json"),
          if (percentage > 80) Lottie.asset("assets/lotties/good_score.json"),
          Center(
            child: Text(
              "Your results: ${calculateTrueAnswersCount()} / ${allQuestions.length}",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

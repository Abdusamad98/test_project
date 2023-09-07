import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/models/subject_model.dart';
import 'package:test_project/ui/subjetcs_screen.dart';

import '../main.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen(
      {super.key, required this.subject, required this.selectedAnswers});

  final SubjectModel subject;
  final Map<int, int> selectedAnswers;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  setResult() async {
    int currentResult = calculateTrueAnswersCount();
    int? subjectResult = prefs.getInt(widget.subject.resultKey);
    if (subjectResult != null) {
      if (subjectResult < currentResult) {
        prefs.setInt(widget.subject.resultKey, currentResult);
      }
    } else {
      prefs.setInt(widget.subject.resultKey, currentResult);
    }
  }

  @override
  void initState() {
    setResult();
    super.initState();
  }

  int calculateTrueAnswersCount() {
    int trueAnswerCount = 0;
    for (int i = 0; i < widget.subject.questions.length; i++) {
      if (widget.subject.questions[i].trueAnswer == widget.selectedAnswers[i]) {
        trueAnswerCount++;
      }
    }
    return trueAnswerCount;
  }

  @override
  Widget build(BuildContext context) {
    double percentage =
        (calculateTrueAnswersCount() * 100) / widget.subject.questions.length;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SubjectScreen();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text("Results form ${widget.subject.subjectName} $percentage"),
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
              "Your results: ${calculateTrueAnswersCount()}/${widget.subject.questions.length}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:test_project/models/subject_model.dart';
import 'package:test_project/ui/quiz/quiz_screen.dart';

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

    double perecentage =
        (calculateTrueAnswersCount() * 100) / (selectedAnswers.length);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Results"),
        ),
        body: ListView(
          children: [
            if (perecentage >= 0 && perecentage <= 56)
              Lottie.asset(
                "assets/lotties/failure.json",
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            if (perecentage > 56 && perecentage <= 80)
              Lottie.asset(
                "assets/lotties/average_score.json",
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            if (perecentage > 80)
              Lottie.asset(
                "assets/lotties/success.json",
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            const SizedBox(height: 30),
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 12.0,
              percent: perecentage / 100,
              center: Text(
                "${perecentage.toStringAsFixed(0)} %",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              progressColor: Colors.green,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your score:  ${calculateTrueAnswersCount()} / ${subject.questions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 30),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return QuizScreen(subject: subject);
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.restart_alt,
                    size: 40,
                    color: Colors.green,
                  ),
                )
              ],
            )
          ],
        ));
  }
}

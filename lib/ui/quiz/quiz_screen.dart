import 'package:flutter/material.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';
import 'package:test_project/ui/quiz/widgets/answer_button.dart';
import 'package:test_project/ui/results/results_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.subject});

  final SubjectModel subject;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int selectedAnswerOrder = -1;
  List<QuestionModel> questions = [];
  Map<int, int> selectedAnswers = {};

  @override
  void initState() {
    questions = widget.subject.questions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz from ${widget.subject.subjectName}"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q/${currentQuestionIndex + 1}. ",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        questions[currentQuestionIndex].questionText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                AnswerButton(
                  questionText: "A) ${questions[currentQuestionIndex].answer1}",
                  isSelected: selectedAnswerOrder == 1,
                  onTap: () {
                    setState(() {
                      selectedAnswerOrder = 1;
                      selectedAnswers[currentQuestionIndex] =
                          selectedAnswerOrder;
                    });
                  },
                ),
                AnswerButton(
                  questionText: "B) ${questions[currentQuestionIndex].answer2}",
                  isSelected: selectedAnswerOrder == 2,
                  onTap: () {
                    setState(() {
                      selectedAnswerOrder = 2;
                      selectedAnswers[currentQuestionIndex] =
                          selectedAnswerOrder;
                    });
                  },
                ),
                AnswerButton(
                  questionText: "C) ${questions[currentQuestionIndex].answer3}",
                  isSelected: selectedAnswerOrder == 3,
                  onTap: () {
                    setState(() {
                      selectedAnswerOrder = 3;
                      selectedAnswers[currentQuestionIndex] =
                          selectedAnswerOrder;
                    });
                  },
                ),
                AnswerButton(
                  questionText: "D) ${questions[currentQuestionIndex].answer4}",
                  isSelected: selectedAnswerOrder == 4,
                  onTap: () {
                    setState(() {
                      selectedAnswerOrder = 4;
                      selectedAnswers[currentQuestionIndex] =
                          selectedAnswerOrder;
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 120,
                child: TextButton(
                  onPressed: () {
                    debugPrint(
                        "CURRENT SELECTED QUESTION DATA: $selectedAnswers");

                    //Check if current question selected.
                    if (selectedAnswerOrder == -1) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          margin: EdgeInsets.symmetric(
                            vertical: 100,
                            horizontal: 20,
                          ),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          content: Text("Choose one of the options!!!"),
                        ),
                      );
                      return;
                    }
                    //Check if it has next question.
                    if (currentQuestionIndex < questions.length - 1) {
                      setState(() {
                        currentQuestionIndex++;
                        selectedAnswerOrder = -1;
                      });
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResultsScreen(
                              subject: widget.subject,
                              selectedAnswers: selectedAnswers,
                            );
                          },
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(currentQuestionIndex == questions.length - 1
                          ? "RESULTS"
                          : "NEXT"),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

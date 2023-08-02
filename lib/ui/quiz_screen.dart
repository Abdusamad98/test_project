import 'package:flutter/material.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';
import 'package:test_project/ui/results_screen.dart';
import 'package:test_project/ui/widgets/answer_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.subject});

  final SubjectModel subject;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuestionModel> questions = [];
  List<int> selectedAnswerOrders = [];
  int currentQuestionIndex = 0;
  int selectedQuestionOrder = -1;

  @override
  void initState() {
    questions = widget.subject.questions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz from ${widget.subject.subjectName} "),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    Text(
                      "Q/${currentQuestionIndex + 1}. ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      questions[currentQuestionIndex].questionText,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                AnswerButton(
                  answerText: "A) ${questions[currentQuestionIndex].answer1}",
                  onTap: () {
                    setState(() {
                      selectedQuestionOrder = 1;
                    });
                  },
                  isSelected: selectedQuestionOrder == 1,
                ),
                AnswerButton(
                  answerText: "B) ${questions[currentQuestionIndex].answer2}",
                  onTap: () {
                    setState(() {
                      selectedQuestionOrder = 2;
                    });
                  },
                  isSelected: selectedQuestionOrder == 2,
                ),
                AnswerButton(
                  answerText: "C) ${questions[currentQuestionIndex].answer3}",
                  onTap: () {
                    setState(() {
                      selectedQuestionOrder = 3;
                    });
                  },
                  isSelected: selectedQuestionOrder == 3,
                ),
                AnswerButton(
                  answerText: "D) ${questions[currentQuestionIndex].answer4}",
                  onTap: () {
                    setState(() {
                      selectedQuestionOrder = 4;
                    });
                  },
                  isSelected: selectedQuestionOrder == 4,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                child: TextButton(
                  onPressed: () {
                    if (selectedQuestionOrder == -1) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 500),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 100,
                          ),
                          backgroundColor: Colors.red,
                          content: Text(
                            "Select one of these answers !!!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                      return;
                    }

                    if (currentQuestionIndex == questions.length - 1) {
                      selectedAnswerOrders.add(selectedQuestionOrder);
                    }


                    if (currentQuestionIndex < questions.length - 1) {
                      setState(() {
                        currentQuestionIndex++;
                        selectedAnswerOrders.add(selectedQuestionOrder);
                        selectedQuestionOrder = -1;
                      });
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return ResultsScreen(
                          allQuestions: questions,
                          selectedAnswersOrder: selectedAnswerOrders,
                        );
                      }));
                    }
                  },
                  child: Row(
                    children: [
                      Text(currentQuestionIndex == questions.length - 1
                          ? "RESULTS"
                          : "NEXT"),
                      const SizedBox(width: 12),
                      const Icon(Icons.arrow_forward)
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

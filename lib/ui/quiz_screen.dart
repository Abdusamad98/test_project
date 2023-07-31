import 'package:flutter/material.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';
import 'package:test_project/ui/results_screen.dart';
import 'package:test_project/ui/widgets/answer_button.dart';
import 'package:test_project/ui/widgets/question_text_view.dart';
import 'package:test_project/utils/colors.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.subjectModel});

  final SubjectModel subjectModel;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuestionModel> questions = [];

  int currentQuestionIndex = 0;
  int selectedAnswerOrder = -1;

  Map<int, int> selectedAnswers = {};

  @override
  void initState() {
    questions = widget.subjectModel.questions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz from ${widget.subjectModel.subjectName}"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                QuestionTextView(
                  questionText: questions[currentQuestionIndex].questionText,
                  currentQuestionIndex: currentQuestionIndex,
                ),
                const SizedBox(height: 20),
                AnswerButton(
                  answerText: "A) ${questions[currentQuestionIndex].answer1}",
                  isSelected: selectedAnswerOrder == 1,
                  onTap: () {
                    setState(() {
                      selectedAnswerOrder = 1;
                      selectedAnswers[currentQuestionIndex] = selectedAnswerOrder;
                    });
                  },
                ),
                AnswerButton(
                  answerText: "B) ${questions[currentQuestionIndex].answer2}",
                  isSelected: selectedAnswerOrder == 2,
                  onTap: () {
                    setState(() {
                      selectedAnswerOrder = 2;
                      selectedAnswers[currentQuestionIndex] = selectedAnswerOrder;
                    });
                  },
                ),
                AnswerButton(
                  answerText: "C) ${questions[currentQuestionIndex].answer3}",
                  isSelected: selectedAnswerOrder == 3,
                  onTap: () {
                    setState(() {
                      selectedAnswerOrder = 3;
                      selectedAnswers[currentQuestionIndex] = selectedAnswerOrder;

                    });
                  },
                ),
                AnswerButton(
                  answerText: "D) ${questions[currentQuestionIndex].answer4}",
                  isSelected: selectedAnswerOrder == 4,
                  onTap: () {
                    setState(() {
                      selectedAnswerOrder = 4;
                      selectedAnswers[currentQuestionIndex] = selectedAnswerOrder;
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

                    print("CURRENTLY SELECTED ANSWERS STATE: $selectedAnswers");

                    if (selectedAnswerOrder == -1) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          margin: EdgeInsets.symmetric(
                            vertical: 100,
                            horizontal: 20,
                          ),
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            "Choose one of these options!!!",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                      return;
                    }
                    if (currentQuestionIndex < questions.length - 1) {
                      currentQuestionIndex++;
                      selectedAnswerOrder = -1;
                      setState(() {});
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResultsScreen(
                              selectedAnswers: selectedAnswers,
                              subject: widget.subjectModel,
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
                      SizedBox(width: 12),
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

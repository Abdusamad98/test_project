import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';
import 'package:test_project/ui/result_screen.dart';
import 'package:test_project/ui/widgets/answer_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.subjectModel});

  final SubjectModel subjectModel;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int selectedAnswerOrder = -1;

  List<QuestionModel> questions = [];

  List<int> selectedAnswers = [];

  @override
  void initState() {
    questions = widget.subjectModel.questions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question from ${widget.subjectModel.subjectName}"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    Text(
                      "Q/${currentQuestionIndex + 1}. ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        questions[currentQuestionIndex].questionText,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                AnswerButton(
                  onTap: () {
                    setState(() {
                      selectedAnswerOrder = 1;
                    });
                  },
                  isSelected: selectedAnswerOrder == 1,
                  answerText: "A) ${questions[currentQuestionIndex].answer1}",
                ),
                AnswerButton(
                  onTap: () {
                    setState(() {
                      selectedAnswerOrder = 2;
                    });
                  },
                  isSelected: selectedAnswerOrder == 2,
                  answerText: "B) ${questions[currentQuestionIndex].answer2}",
                ),
                AnswerButton(
                  onTap: () {
                    setState(() {
                      selectedAnswerOrder = 3;
                    });
                  },
                  isSelected: selectedAnswerOrder == 3,
                  answerText: "C) ${questions[currentQuestionIndex].answer3}",
                ),
                AnswerButton(
                  onTap: () {
                    setState(() {
                      selectedAnswerOrder = 4;
                    });
                  },
                  isSelected: selectedAnswerOrder == 4,
                  answerText: "D) ${questions[currentQuestionIndex].answer4}",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (currentQuestionIndex == questions.length - 1)
                          ? const Text("RESULTS")
                          : const Text("NEXT"),
                      const SizedBox(width: 10),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                  onPressed: () {
                    print("CURRENT SELECTED ANSWERS:$selectedAnswers");

                    if (selectedAnswerOrder == -1) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.red,
                          margin: EdgeInsets.symmetric(
                            vertical: 100,
                            horizontal: 20,
                          ),
                          content: Text(
                            "Select answer !!!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                      return;
                    }

                    if (currentQuestionIndex == questions.length - 1) {
                      selectedAnswers.add(selectedAnswerOrder);
                    }

                    if (currentQuestionIndex < questions.length - 1) {
                      setState(() {
                        currentQuestionIndex++;
                        selectedAnswers.add(selectedAnswerOrder);
                        selectedAnswerOrder = -1;
                      });
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResultsScreen(
                              subject: widget.subjectModel,
                              selectedAnswers: selectedAnswers,
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
          Platform.isIOS ? SizedBox(height: 50) : SizedBox()

        ],
      ),
    );
  }
}

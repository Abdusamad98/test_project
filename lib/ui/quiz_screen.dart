import 'package:flutter/material.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';
import 'package:test_project/ui/widgets/answer_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.subjectModel,
  });

  final SubjectModel subjectModel;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int selectedQuestionOrder = -1;
  Map<int, int> selectedAnswers = {};
  List<QuestionModel> questions = [];

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
                Row(
                  children: [
                    Text(
                      "Q/${currentQuestionIndex + 1}. ",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      questions[currentQuestionIndex].questionText,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                AnswerButton(
                  answerText: "A) ${questions[currentQuestionIndex].answer1}",
                  isSelected: selectedQuestionOrder == 1,
                  onTap: () {
                    setState(() {
                      selectedQuestionOrder = 1;
                      selectedAnswers[currentQuestionIndex] =
                          selectedQuestionOrder;
                    });
                  },
                ),
                AnswerButton(
                  answerText: "B) ${questions[currentQuestionIndex].answer2}",
                  isSelected: selectedQuestionOrder == 2,
                  onTap: () {
                    setState(() {
                      selectedQuestionOrder = 2;
                      selectedAnswers[currentQuestionIndex] =
                          selectedQuestionOrder;
                    });
                  },
                ),
                AnswerButton(
                  answerText: "C) ${questions[currentQuestionIndex].answer3}",
                  isSelected: selectedQuestionOrder == 3,
                  onTap: () {
                    setState(() {
                      selectedQuestionOrder = 3;
                      selectedAnswers[currentQuestionIndex] =
                          selectedQuestionOrder;
                    });
                  },
                ),
                AnswerButton(
                  answerText: "D) ${questions[currentQuestionIndex].answer4}",
                  isSelected: selectedQuestionOrder == 4,
                  onTap: () {
                    setState(() {
                      selectedQuestionOrder = 4;
                      selectedAnswers[currentQuestionIndex] =
                          selectedQuestionOrder;
                    });
                  },
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              if (currentQuestionIndex < questions.length - 1) {
                currentQuestionIndex++;
                selectedQuestionOrder = -1;
              }
              setState(() {});

              print("CURRENT ANSWERS LIST: $selectedAnswers");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  ((currentQuestionIndex) == questions.length - 1)
                      ? "RESULT"
                      : "NEXT",
                ),
                const SizedBox(width: 12),
                const Icon(Icons.arrow_forward)
              ],
            ),
          )
        ],
      ),
    );
  }
}

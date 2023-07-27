import 'package:flutter/material.dart';
import 'package:test_project/utils/colors.dart';

class QuestionTextView extends StatelessWidget {
  const QuestionTextView({super.key, required this.questionText, required this.currentQuestionIndex});

  final String questionText;
  final int currentQuestionIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Question ${currentQuestionIndex+1}: ",
          style: const TextStyle(
            color: AppColors.C_F2954D,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        Expanded(
          child: Text(
            questionText,
            maxLines: 10,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}

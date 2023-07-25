import 'package:flutter/material.dart';
import 'package:test_project/models/subject_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.subject});

  final SubjectModel subject;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz from ${widget.subject.subjectName}"),
      ),
    );
  }
}

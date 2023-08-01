import 'package:flutter/material.dart';
import 'package:test_project/data/app_repository.dart';
import 'package:test_project/ui/quiz_screen.dart';
import 'package:test_project/ui/widgets/subject_item_view.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subjects screen"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          for (int i = 0; i < AppRepository.subjects.length; i++)
            SubjectItemView(
              subject: AppRepository.subjects[i],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QuizScreen(subject: AppRepository.subjects[i]);
                    },
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}

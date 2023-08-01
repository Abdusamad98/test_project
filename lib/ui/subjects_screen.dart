import 'package:flutter/material.dart';
import 'package:test_project/data/repository.dart';
import 'package:test_project/ui/quiz_screen.dart';
import 'package:test_project/ui/widgets/subject_item_view.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subjects"),
      ),
      body: ListView(
        children: [
          for (int index = 0; index < AppRepository.subjects.length; index++)
            SubjectItemView(
              subject: AppRepository.subjects[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QuizScreen(
                          subjectModel: AppRepository.subjects[index]);
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

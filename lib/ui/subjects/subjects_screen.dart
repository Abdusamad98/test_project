import 'package:flutter/material.dart';
import 'package:test_project/models/subject_model.dart';
import 'package:test_project/repository/subjects_repository.dart';
import 'package:test_project/ui/quiz/quiz_screen.dart';
import 'package:test_project/ui/subjects/widgets/subject_item_view.dart';

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
          for (int index = 0; index < SubjectsRepository.allSubjects.length; index++)
            SubjectItemView(
              subject: SubjectsRepository.allSubjects[index],
              oTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QuizScreen(
                          subject: SubjectsRepository.allSubjects[index]);
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

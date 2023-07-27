import 'package:flutter/material.dart';
import 'package:test_project/repository/app_repository.dart';
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
        title: Text("Subjects"),
      ),
      body: ListView(
        children: [
          for (int index = 0; index < AppRepository.subjects.length; index++)
            SubjectItemView(
              subjectModel: AppRepository.subjects[index],
              onSubjectPressed: () {
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

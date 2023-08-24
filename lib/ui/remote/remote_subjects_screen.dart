import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_project/data/app_repository.dart';
import 'package:test_project/models/remote_question_model.dart';
import 'package:test_project/models/remote_subject_model.dart';
import 'package:test_project/ui/quiz_screen.dart';
import 'package:test_project/ui/remote/remote_quiz_screen.dart';
import 'package:test_project/ui/remote/widgets/remote_subject_item_view.dart';
import 'package:test_project/ui/widgets/subject_item_view.dart';
import 'package:http/http.dart' as http;

class RemoteSubjectsScreen extends StatefulWidget {
  const RemoteSubjectsScreen({super.key});

  @override
  State<RemoteSubjectsScreen> createState() => _RemoteSubjectsScreenState();
}

class _RemoteSubjectsScreenState extends State<RemoteSubjectsScreen> {
  List<RemoteSubjectModel> subjects = [];
  List<RemoteQuestionModel> subjectQuestions = [];

  @override
  void initState() {
    getAllSubjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subjects")),
      body: ListView(
        children: [
          if (subjects.isNotEmpty)
            for (int index = 0; index < subjects.length; index++)
              RemoteSubjectItemView(
                subject: subjects[index],
                onTap: () {
                  subjectQuestions = [];
                  getSubjectQuestions(subjects[index].id);
                },
              )
        ],
      ),
    );
  }

  Future<void> getAllSubjects() async {
    http.Response response =
        await http.get(Uri.parse("http://16.171.176.5:9856/api/subjects/"));
    if (response.statusCode == 200) {
      subjects = ((jsonDecode(response.body)["subjects"]) as List?)
              ?.map((e) => RemoteSubjectModel.fromJson(e))
              .toList() ??
          [];

      setState(() {});
    }
  }

  Future<void> getSubjectQuestions(int subjectId) async {
    http.Response response = await http
        .get(Uri.parse("http://16.171.176.5:9856/api/subjects/$subjectId"));
    if (response.statusCode == 200) {
      subjectQuestions = ((jsonDecode(response.body)["questions"]) as List?)
              ?.map((e) => RemoteQuestionModel.fromJson(e))
              .toList() ??
          [];

      if (subjectQuestions.isNotEmpty && context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RemoteQuizScreen(
                questions: subjectQuestions,
              );
            },
          ),
        );
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:test_project/models/subject_model.dart';

class SubjectItemView extends StatelessWidget {
  const SubjectItemView({super.key, required this.subject, required this.oTap});

  final SubjectModel subject;
  final VoidCallback oTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: oTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: subject.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.subjectName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 25),
                  Text(
                    "Questions count: ${subject.questions.length}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              subject.iconPath,
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

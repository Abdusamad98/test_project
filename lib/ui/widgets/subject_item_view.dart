import 'package:flutter/material.dart';
import 'package:test_project/models/subject_model.dart';

class SubjectItemView extends StatelessWidget {
  const SubjectItemView({
    super.key,
    required this.subject,
    required this.onTap,
  });

  final SubjectModel subject;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: subject.color,
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
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Question count: ${subject.questions.length}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Image.asset(
              subject.iconPath,
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}

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
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: subject.color,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject.subjectName,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Questions count: ${subject.questions.length}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
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

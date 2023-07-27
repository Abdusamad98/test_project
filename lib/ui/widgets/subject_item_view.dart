import 'package:flutter/material.dart';
import 'package:test_project/models/subject_model.dart';

class SubjectItemView extends StatelessWidget {
  const SubjectItemView({super.key, required this.subjectModel, required this.onSubjectPressed});

  final SubjectModel subjectModel;
  final VoidCallback onSubjectPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSubjectPressed,
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: subjectModel.color),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subjectModel.subjectName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Questions count: ${subjectModel.questions.length}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )),
            Image.asset(
              subjectModel.iconPath,
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}

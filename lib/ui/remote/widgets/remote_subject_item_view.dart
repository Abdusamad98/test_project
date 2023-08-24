import 'package:flutter/material.dart';
import 'package:test_project/models/remote_subject_model.dart';
import 'package:test_project/models/subject_model.dart';

class RemoteSubjectItemView extends StatelessWidget {
  const RemoteSubjectItemView({
    super.key,
    required this.subject,
    required this.onTap,
  });

  final RemoteSubjectModel subject;
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
                    subject.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Image.network(
              subject.iconPath,
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}

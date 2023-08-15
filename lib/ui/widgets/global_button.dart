import 'package:flutter/material.dart';
import 'package:test_project/utils/colors.dart';


class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.onTap, required this.text});

  final VoidCallback onTap;

  final String text;

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 40,
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      child: TextButton(
        style:
        TextButton.styleFrom(backgroundColor: AppColors.pdpSecondary),
        onPressed: onTap,
        child:  Text(
         text,
          style: const TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}

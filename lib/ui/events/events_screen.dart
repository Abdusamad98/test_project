import 'package:flutter/material.dart';
import 'package:test_project/utils/colors.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "University events",
          style: TextStyle(
            fontSize: 22,
            color: AppColors.white,
          ),
        ),
      ),
    );
    ;
  }
}

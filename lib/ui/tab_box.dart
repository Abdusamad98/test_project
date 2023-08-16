import 'package:flutter/material.dart';
import 'package:test_project/ui/about/about_screen.dart';
import 'package:test_project/ui/courses/courses_screen.dart';
import 'package:test_project/ui/events/events_screen.dart';
import 'package:test_project/utils/colors.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  int currentIndex = 0;

  @override
  void initState() {
    screens = [
      AboutScreen(),
      CoursesScreen(),
      EventsScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.pdpMain,
        backgroundColor: AppColors.pdpSecondary,
        onTap: (newScreenIndex) {
          setState(() {
            currentIndex = newScreenIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Courses"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded), label: "Events"),
        ],
      ),
    );
  }
}

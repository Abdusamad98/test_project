import 'package:flutter/material.dart';
import 'package:test_project/ui/tab/about/about_screen.dart';
import 'package:test_project/ui/tab/courses/courses_screen.dart';
import 'package:test_project/ui/tab/events/events_screen.dart';
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
        selectedItemColor: AppColors.pdpMain,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            setState(() {
              currentIndex = index;
            });
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
          BottomNavigationBarItem(icon: Icon(Icons.subject), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
        ],
      ),
    );
  }
}

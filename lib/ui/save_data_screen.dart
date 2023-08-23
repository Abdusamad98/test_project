import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveDataScreen extends StatefulWidget {
  const SaveDataScreen({super.key});

  @override
  State<SaveDataScreen> createState() => _SaveDataScreenState();
}

class _SaveDataScreenState extends State<SaveDataScreen> {
  int counter = 0;
  late SharedPreferences pref;

  int timerSecond = 0;
  int timerMinute = 0;

  _init() async {
    pref = await SharedPreferences.getInstance();
    int? savedValue = pref.getInt("counter");
    if (savedValue != null) {
      setState(() {
        counter = savedValue;
      });
    }
  }

  timerLogic() async {
    for (int i = 0; i < 10000000; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (timerSecond == 59) {
        setState(() {
          timerSecond = 0;
          timerMinute++;
        });
      } else {
        setState(() {
          timerSecond++;
        });
      }
    }
   /// pref.setInt("english_result_time", timerSecond + timerMinute * 60);
  }

  @override
  void initState() {
    timerLogic();
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save Data"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            "TIMER: ${(timerMinute < 10) ? 0 : ""}$timerMinute: $timerSecond",
            style: const TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Counter: $counter",
            style: const TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            counter++;
          });
          bool isSaved = await pref.setInt("counter", counter);
          print("IS_SAVED:$isSaved");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

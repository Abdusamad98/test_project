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

  Future<void> _init() async {
    pref = await SharedPreferences.getInstance();
    int? savedCounter = pref.getInt("counter_value");
    if (savedCounter != null) {
      setState(() {
        counter = savedCounter;
      });
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save Data to Local cache"),
      ),
      body: Column(
        children: [
          Text(
            "COUNTER: $counter",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 35,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
          pref.setInt("counter_value", counter);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

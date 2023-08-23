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
    int? savedCounter = pref.getInt("counter");
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
        title: const Text("Save variable"),
      ),
      body: Center(
        child: Text(
          "COUNTER: $counter",
          style: const TextStyle(color: Colors.black, fontSize: 35),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            counter++;
          });
          pref.setInt("counter", counter);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

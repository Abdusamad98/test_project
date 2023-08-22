import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveDataScreen extends StatefulWidget {
  const SaveDataScreen({super.key});

  @override
  State<SaveDataScreen> createState() => _SaveDataScreenState();
}

class _SaveDataScreenState extends State<SaveDataScreen> {
  int mathResult = 0;
  int englishResult = 0;

  late SharedPreferences pref;

  _init() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      mathResult = getIntFromShared("math_result");
      englishResult = getIntFromShared("english_result");
    });
  }

  int getIntFromShared(String intKey) {
    int? value = pref.getInt(intKey);
    if (value != null) {
      return value;
    } else {
      return 0;
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
        title: const Text("Save Data Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "MATH RECORD = $mathResult",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 35,
              ),
            ),
            Text(
              "ENGLISH RECORD = $englishResult",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            mathResult++;
            englishResult = mathResult + 2;
            pref.setInt("math_result", mathResult);
            pref.setInt("english_result", englishResult);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

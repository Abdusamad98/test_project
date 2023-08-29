import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD1D1D1),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Discount",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
                hintText: "Discount Search",
                hintStyle: const TextStyle(fontSize: 12),
                contentPadding: const EdgeInsets.all(12),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

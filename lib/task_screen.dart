import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  List<LinearGradient> gradients = [
    const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xFF0052D4),
          Color(0xFF4364F7),
          Color(0xFF6FB1FC),
        ]),
    const LinearGradient(colors: [
      Color(0xFF4776E6),
      Color(0xFF8E54E9),
    ]),
    const LinearGradient(colors: [
      Color(0xFFEC008C),
      Color(0xFFFC6767),
    ]),
    const LinearGradient(colors: [
      Colors.white,
      Colors.black,
    ]),
    const LinearGradient(colors: [
      Colors.green,
      Colors.grey,
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(("assets/images/arrow_back.png")),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Discount",
            style: GoogleFonts.rubik(
              color: Colors.blue,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.grey,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.blue,
                      )),
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Search Discount",
                  hintStyle: GoogleFonts.rubik(fontSize: 12)),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFFD1D1D1).withOpacity(0.5),
              child: ListView(
                children: [
                  for (var gradient in gradients)
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: gradient,
                      ),
                      child: const Center(child: Text("Hello")),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

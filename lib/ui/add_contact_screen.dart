import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.done,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        title: const Text(
          "Add",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 5),
            const TextField(
              decoration: InputDecoration(
                hintText: "Enter name",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Surname",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 5),
            const TextField(
              decoration: InputDecoration(
                hintText: "Enter surname",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Phone number",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 5),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "_ _  _ _ _  _ _  _ _",
                prefixIcon: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: const Text(
                      "+998",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF9E9E9E),
                      ),
                    )),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 2,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

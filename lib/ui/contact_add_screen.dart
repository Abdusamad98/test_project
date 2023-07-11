import 'package:flutter/material.dart';

class ContactAddScreen extends StatefulWidget {
  const ContactAddScreen({super.key});

  @override
  State<ContactAddScreen> createState() => _ContactAddScreenState();
}

class _ContactAddScreenState extends State<ContactAddScreen> {
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
        backgroundColor: Colors.white,
        title: const Text(
          "Add",
          style: TextStyle(color: Colors.black),
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
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: const [
          Text(
            "Name",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter name",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.5)),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Surname",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter surname",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.5)),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Phone",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  child: Text(
                    "+998",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  )),
              hintText: "_ _  _ _ _  _ _  _ _",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.5)),
            ),
          ),
        ],
      ),
    );
  }
}

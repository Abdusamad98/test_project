import 'package:flutter/material.dart';
import 'package:test_project/ui/add_contact_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/contact_model.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<ContactModel> contacts = [
    for (int i = 0; i < 100; i++)
      ContactModel(
        contactPhone: "+998991234567",
        contactName: "Abdulloh$i",
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Contacts",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          for (int i = 0; i < 100; i++)
            ListTile(
              onTap: () {},
              title: Text(contacts[i].contactName),
              subtitle: Text(contacts[i].contactPhone),
              trailing: IconButton(
                onPressed: () async {
                  launchUrl(Uri.parse("tel:${contacts[i].contactPhone}"));
                },
                icon: const Icon(
                  Icons.call,
                  color: Colors.green,
                ),
              ),
              leading: const Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 40,
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ContactAddScreen();
              },
            ),
          );


        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

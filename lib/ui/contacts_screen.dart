import 'package:flutter/material.dart';
import 'package:test_project/models/contact_model.dart';
import 'package:test_project/ui/add_contact_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<ContactModel> contacts = [
    for (int i = 0; i < 100; i++)
      ContactModel(
        contactPhone: "+99890 974 94 62",
        contactName: "Abdulloh${i + 1}",
      )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Contacts",
          style: TextStyle(
            color: Colors.black,
          ),
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
          )
        ],
      ),
      body: ListView(
        children: [
          for (int i = 0; i < 100; i++)
            ListTile(
              onTap: () {},
              trailing: IconButton(
                onPressed: () async {
                  await launchUrl(Uri.parse("tel:${contacts[i].contactPhone}"));
                },
                icon: const Icon(
                  Icons.call,
                  color: Colors.green,
                ),
              ),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 40,
                ),
              ),
              title: Text(
                contacts[i].contactName,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              subtitle: Text(
                contacts[i].contactPhone,
                style: const TextStyle(
                  color: Color(0xFF8B8B8B),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddContactScreen();
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

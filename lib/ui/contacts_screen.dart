import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        contactName: "Abdulloh $i",
        contactPhone: "+9989 123 45 67",
        contactSurname: "Falonchiyev$i",
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        backgroundColor: Colors.white,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        title: const Text(
          "Contacts",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: List.generate(contacts.length, (index) {
          return ListTile(
            onTap: () {},
            title: Text(contacts[index].contactName),
            subtitle: Text(contacts[index].contactPhone),
            leading: const Icon(
              Icons.account_circle,
              size: 50,
            ),
            trailing: IconButton(
              onPressed: () async {
                await launchUrl(
                  Uri.parse("tel:${contacts[index].contactPhone}"),
                );
              },
              icon: const Icon(
                Icons.call,
                color: Colors.green,
              ),
            ),
          );
        }),
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
        child: const Icon(Icons.add),
      ),
    );
  }
}

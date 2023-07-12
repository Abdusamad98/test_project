import 'package:flutter/material.dart';
import 'package:test_project/model/contact_model.dart';
import 'package:test_project/ui/contact_add_screen.dart';
import 'package:test_project/ui/contact_detail_screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<ContactModel> contacts = [
    ContactModel(
      contactName: "Abdulloh",
      contactPhone: "+998991234567",
      contactSurname: "Falonchiyev",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text(
          "Contacts",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          for (int i = 0; i < contacts.length; i++)
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ContactDetailScreen(
                        contactModel: contacts[i],
                      );
                    },
                  ),
                );
              },
              title: Text(contacts[i].contactName),
              subtitle: Text(contacts[i].contactPhone),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.call,
                  color: Colors.green,
                ),
              ),
              leading: const Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 50,
              ),
            )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ContactAddScreen(
                  onNewContact: (newContact) {
                    setState(() {
                      contacts.add(newContact);
                    });
                  },
                );
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

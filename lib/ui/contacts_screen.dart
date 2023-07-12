import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/local/db.dart';
import 'package:test_project/models/contact_model.dart';
import 'package:test_project/models/contact_model_sql.dart';
import 'package:test_project/ui/add_contact_screen.dart';
import 'package:test_project/ui/contact_detail_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<ContactModel> contacts = [];

  readContactsFromDB() async {
    contacts = [];
    List<ContactModelSql> dbContacts = await LocalDatabase.getAllContacts();
    for (var value in dbContacts) {
      contacts.add(
        ContactModel(
          contactPhone: value.phone,
          contactName: value.name,
          contactSurname: "TEST",
        ),
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    readContactsFromDB();
    super.initState();
  }

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
          ),
        ],
        backgroundColor: Colors.white,
        title: const Text(
          "Contacts",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: contacts.isEmpty
          ? SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svg/empty_box.svg"),
                  const SizedBox(height: 20),
                  const Text("You have no contacts yet")
                ],
              ),
            )
          : ListView(
              children: [
                for (int i = 0; i < contacts.length; i++)
                  ListTile(
                    title: Text(contacts[i].contactName),
                    subtitle: Text(contacts[i].contactPhone),
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                        size: 40,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () async {
                        await launchUrl(
                            Uri.parse("tel:${contacts[i].contactPhone}"));
                      },
                      icon: const Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ContactDetailScreen(
                            contactModel: contacts[i],
                          );
                        }),
                      );
                    },
                  )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddContactScreen(
                  onNewContact: (newContact) {
                    readContactsFromDB();
                  },
                );
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

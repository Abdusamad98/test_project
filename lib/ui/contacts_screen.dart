import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/ui/add_contact_screen.dart';
import 'package:test_project/ui/contact_detail_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/contact_model.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<ContactModel> contacts = [];

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
      body: contacts.isNotEmpty
          ? ListView(
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
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/empty_box.svg"),
            const SizedBox(height: 20),
            const Text(
              "You have no contacts yet",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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

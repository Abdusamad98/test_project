import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/local_db/local_database.dart';
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
  List<ContactModelSql> contacts = [];

  _init() async {
    contacts = await LocalDatabase.getAllContacts();
    setState(() {});
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

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
                              contactDeleteListener: () {
                                _init();
                              },
                            );
                          },
                        ),
                      );
                    },
                    trailing: IconButton(
                      onPressed: () async {
                        await launchUrl(Uri.parse("tel:${contacts[i].phone}"));
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
                      contacts[i].name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    subtitle: Text(
                      contacts[i].phone,
                      style: const TextStyle(
                        color: Color(0xFF8B8B8B),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg/empty.svg",
                  width: 100,
                ),
                const Center(
                  child: Text(
                    "You have no contacts yet",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
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
                return AddContactScreen(
                  onNewContact: (newContact) {
                    setState(() {
                      LocalDatabase.insertContact(newContact);
                      _init();
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

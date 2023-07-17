import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/local_db/local_database.dart';
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

  _syncDatabase() async {
    contacts = await LocalDatabase.getAllContacts();
    setState(() {});
  }

  @override
  void initState() {
    _syncDatabase();
    super.initState();
  }

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
      body: contacts.isNotEmpty
          ? ListView(
              children: List.generate(contacts.length, (index) {
                return ListTile(
                  onTap: () {
                    print("Hello");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ContactDetailScreen(
                            contactModel: contacts[index],
                            syncMainPageListener: (){
                              _syncDatabase();
                            },
                          );
                        },
                      ),
                    );
                  },
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].phone),
                  leading: const Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse("tel:${contacts[index].phone}"),
                      );
                    },
                    icon: const Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
                  ),
                );
              }),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/svg/empty.svg"),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "You have no contacts yet",
                    style: TextStyle(fontSize: 16),
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
                  onNewContact: (newContact) async {
                    await LocalDatabase.insertContact(newContact);
                    _syncDatabase();
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

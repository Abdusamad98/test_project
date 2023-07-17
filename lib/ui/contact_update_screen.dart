import 'package:flutter/material.dart';
import 'package:test_project/local_db/local_database.dart';
import 'package:test_project/model/contact_model_sql.dart';

class ContactUpdateScreen extends StatefulWidget {
  const ContactUpdateScreen(
      {super.key,
      required this.currentContact,
      required this.contactUpdateListener});

  final ContactModelSql currentContact;
  final VoidCallback contactUpdateListener;

  @override
  State<ContactUpdateScreen> createState() => _ContactUpdateScreenState();
}

class _ContactUpdateScreenState extends State<ContactUpdateScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.currentContact.name);
    phoneController = TextEditingController(
        text: widget.currentContact.phone
            .substring(4, widget.currentContact.phone.length));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Update Contact",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.done),
            onPressed: () async {
              String name = nameController.text;
              String phone = phoneController.text;

              if (name.isNotEmpty && phone.length == 9) {
                await LocalDatabase.updateContact(
                  contactsModelSql: ContactModelSql(
                      phone: "+998$phone",
                      name: name,
                      id: widget.currentContact.id!),
                );
                widget.contactUpdateListener.call();
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Enter valid data!!!"),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
            "Full Name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Enter name",
              fillColor: const Color(0xFFD9D9D9).withOpacity(0.5),
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Phone number",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 10,
                  ),
                  child: Text("+998")),
              hintText: "_ _  _ _ _  _ _  _ _",
              fillColor: const Color(0xFFD9D9D9).withOpacity(0.5),
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

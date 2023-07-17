import 'package:flutter/material.dart';
import 'package:test_project/local_db/local_database.dart';
import 'package:test_project/models/contact_model_sql.dart';

class UpdateContactScreen extends StatefulWidget {
  const UpdateContactScreen({
    super.key,
    required this.contactModelSql,
    required this.updatedListener,
  });

  final ContactModelSql contactModelSql;
  final VoidCallback updatedListener;

  @override
  State<UpdateContactScreen> createState() => _UpdateContactScreenState();
}

class _UpdateContactScreenState extends State<UpdateContactScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.contactModelSql.name);
    phoneNumberController =
        TextEditingController(text: widget.contactModelSql.phone.substring(4));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Update Contact",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String name = nameController.text;
              String phone = phoneNumberController.text;
              if (name.isNotEmpty) {
                if (phone.length == 9) {
                  await LocalDatabase.updateContact(
                    contactsModelSql: ContactModelSql(
                      name: name,
                      phone: "+998$phone",
                      id: widget.contactModelSql.id,
                    ),
                  );
                  widget.updatedListener.call();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Phone  is not valid")));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Name is empty")));
              }
            },
            icon: const Icon(
              Icons.done,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
            "Full Name",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Enter name",
              filled: true,
              fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          const Text(
            "Phone number",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 10,
                ),
                child: Text(
                  "+998",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              hintText: " _ _  _ _ _  _ _  _ _",
              filled: true,
              fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

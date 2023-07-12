import 'package:flutter/material.dart';
import 'package:test_project/model/contact_model.dart';

class ContactAddScreen extends StatefulWidget {
  const ContactAddScreen({super.key, required this.onNewContact});

  final ValueChanged<ContactModel> onNewContact;

  @override
  State<ContactAddScreen> createState() => _ContactAddScreenState();
}

class _ContactAddScreenState extends State<ContactAddScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Add",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              String name = nameController.text;
              String surname = surnameController.text;
              String phone = phoneController.text;
//991234567
              if (name.isNotEmpty && surname.isNotEmpty && phone.length == 9) {
                ContactModel newContact = ContactModel(
                  contactPhone: "+998$phone",
                  contactName: name,
                  contactSurname: surname,
                );

                widget.onNewContact.call(newContact);

                Navigator.pop(context);

              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Input fileds not valid!!!")));
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
        padding: EdgeInsets.all(15),
        children: [
          const Text(
            "Name",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Enter name",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.5)),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Surname",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: surnameController,
            decoration: const InputDecoration(
              hintText: "Enter surname",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.5)),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Phone",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(
              prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  child: Text(
                    "+998",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  )),
              hintText: "_ _  _ _ _  _ _  _ _",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.5)),
            ),
          ),
        ],
      ),
    );
  }
}

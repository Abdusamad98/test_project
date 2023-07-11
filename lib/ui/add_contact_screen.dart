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
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

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
          "Add",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.done),
            onPressed: () {
              String name = nameController.text;
              String surname = surnameController.text;
              String phone = phoneController.text;

              if (name.isNotEmpty && surname.isNotEmpty && phone.length == 9) {
                widget.onNewContact.call(
                  ContactModel(
                    contactPhone: "+998$phone",
                    contactName: name,
                    contactSurname: surname,
                  ),
                );
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
            "Name",
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
            "Surname",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: surnameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Enter surname",
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

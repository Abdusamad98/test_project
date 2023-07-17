import 'package:flutter/material.dart';
import 'package:test_project/models/contact_model.dart';
import 'package:test_project/models/contact_model_sql.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key, required this.onNewContact});

  final ValueChanged<ContactModelSql> onNewContact;

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Add",
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
            onPressed: () {
              String name = nameController.text;
              String surname = surnameController.text;
              String phone = phoneNumberController.text;

              if (name.isNotEmpty) {
                if (surname.isNotEmpty) {
                  //991234567
                  if (phone.length == 9) {
                    print("CONTACT ADDABLE");
                    widget.onNewContact.call(ContactModelSql(
                      name: "$name $surname",
                      phone: "+998$phone",
                    ));
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Phone  is not valid")));
                  }
                  //+998991234567
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Surname is empty")));
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
            "Name",
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
          const Text(
            "Surname",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: surnameController,
            decoration: InputDecoration(
              hintText: "Enter surname",
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
                child:  Text(
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

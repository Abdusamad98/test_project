import 'package:flutter/material.dart';
import 'package:test_project/local/db.dart';
import 'package:test_project/models/contact_model.dart';
import 'package:test_project/models/contact_model_sql.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({
    super.key,
    required this.onNewContact,
  });

  final ValueChanged<ContactModel> onNewContact;

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {

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
        actions: [
          IconButton(
            //+998991234567
            onPressed: () {
              if (nameController.text.length >= 2 &&
                  surnameController.text.length >= 2 &&
                  phoneController.text.length == 9) {
                ContactModel newContact = ContactModel(
                  contactPhone: "+998${phoneController.text}",
                  contactName: nameController.text,
                  contactSurname: surnameController.text,
                );
                LocalDatabase.insertContact(ContactModelSql(
                  phone: phoneController.text,
                  name: nameController.text,
                ));
                //Sending to ContactsScreen from here
                widget.onNewContact.call(newContact);

                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Enter valid data!!!"),
                  ),
                );
              }
            },
            icon: const Icon(
              Icons.done,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        title: const Text(
          "Add",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: ListView(
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
                  borderSide: BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
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
                  borderSide: BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Phone number",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "_ _  _ _ _  _ _  _ _",
                prefixIcon: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: const Text(
                      "+998",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF9E9E9E),
                      ),
                    )),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 2,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_project/local/local_database.dart';
import 'package:test_project/model/contact_model_sql.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen(
      {super.key, required this.contactModel, required this.deleteListener});

  final ContactModelSql contactModel;
  final VoidCallback deleteListener;

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
        title: const Text(
          "Contact detail",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 100,
                ),
                IconButton(
                    onPressed: () async {
                      await LocalDatabase.deleteContact(contactModel.id!);
                      deleteListener.call();
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.delete)),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit))
              ],
            ),
            const SizedBox(height: 20),
            Text(contactModel.name)
          ],
        ),
      ),
    );
  }
}

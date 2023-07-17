import 'package:flutter/material.dart';
import 'package:test_project/local_db/local_database.dart';
import 'package:test_project/models/contact_model_sql.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen(
      {super.key,
      required this.contactModel,
      required this.contactDeleteListener});

  final ContactModelSql contactModel;
  final VoidCallback contactDeleteListener;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Contact Details",
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(child: SizedBox()),
                const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await LocalDatabase.deleteContact(contactModel.id!);
                          contactDeleteListener.call();
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              contactModel.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Text(
                  contactModel.phone,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () async {
                    await launchUrl(Uri.parse("tel:${contactModel.phone}"));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: const Icon(
                      Icons.call,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.orangeAccent),
                  child: const Icon(
                    Icons.message,
                    size: 16,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

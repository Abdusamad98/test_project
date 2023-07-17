import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/local_db/local_database.dart';
import 'package:test_project/models/contact_model_sql.dart';
import 'package:test_project/ui/update_contact_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen({
    super.key,
    required this.contactModel,
    required this.syncMainPageListener,
  });

  final ContactModelSql contactModel;
  final VoidCallback syncMainPageListener;

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
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        title: const Text(
          "Contact Detail",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 52),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 100,
              ),
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        await LocalDatabase.deleteContact(contactModel.id!);
                        syncMainPageListener.call();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UpdateContactScreen(
                            contactModelSql: contactModel,
                            updatedListener: () {
                              syncMainPageListener.call();
                              Navigator.pop(context);
                            },
                          );
                        }));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            contactModel.name,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  contactModel.phone,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    await launchUrl(
                      Uri.parse("tel:${contactModel.phone}"),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () async {
                    await launchUrl(
                      Uri.parse("sms:${contactModel.phone}"),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Colors.orange, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.message,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

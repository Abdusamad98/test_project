import 'package:flutter/material.dart';
import 'package:test_project/utils/colors.dart';
import 'package:test_project/utils/contents.dart';
import 'package:test_project/utils/images.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About PDP University"),
      ),
      body: ListView(
        children: [
          Image.asset(AppImages.image1),
           Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(12),
               color:AppColors.white
             ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            child: const Text(
              AppContents.pdpInfo,
              style: TextStyle(color: AppColors.black, fontSize: 16),
            ),
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.all(16),
            width: double.infinity,
            child: TextButton(
              style:
                  TextButton.styleFrom(backgroundColor: AppColors.pdpSecondary),
              onPressed: () async {
                await launchUrl(Uri.parse(AppContents.websiteLink));
              },
              child: const Text(
                "GO TO WEBSITE",
                style: TextStyle(color: AppColors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

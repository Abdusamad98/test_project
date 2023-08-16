import 'package:flutter/material.dart';
import 'package:test_project/ui/widgest/global_button.dart';
import 'package:test_project/utils/colors.dart';
import 'package:test_project/utils/contents.dart';
import 'package:test_project/utils/icons.dart';
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
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: PageView(
              children: [
                Image.asset(AppIcons.image1),
                Image.asset(AppIcons.image2),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              AppContents.pdpInfo,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.white),
            child: Image.asset(AppIcons.logo),
          ),
          GlobalButton(
            title: "GO TO WEBSITE",
            onTap: () async {
              await launchUrl(Uri.parse(AppContents.pdpWebsite));
            },
          )
        ],
      ),
    );
  }
}

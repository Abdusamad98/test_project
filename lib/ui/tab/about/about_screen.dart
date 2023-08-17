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
          title: const Text("About PDP University "),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Image.asset(AppImages.image1),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      AppContents.pdpInfo,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: 40,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          backgroundColor: AppColors.pdpSecondary),
                      child: const Text(
                        "GO TO WEBSITE",
                        style: TextStyle(color: AppColors.white),
                      ),
                      onPressed: () async {
                        launchUrl(Uri.parse("https://university.pdp.uz/uz"));
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:test_project/utils/colors.dart';
import 'package:test_project/utils/content.dart';
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
            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(child: Image.asset(AppImages.image1)),
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                      Expanded(
                          child: Image.asset(
                        AppImages.image2,
                        fit: BoxFit.fill,
                      )),
                      const SizedBox(
                        width: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white),
              child: const Text(
                AppContents.pdpInfo,
                style: TextStyle(fontSize: 17),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(child: Image.asset(AppImages.logo)),
            ),
            Container(
              margin: const EdgeInsets.all(24),
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50), // <-- Radius
                    ),
                    backgroundColor: AppColors.pdpSecondary),
                onPressed: () async {
                  await launchUrl(Uri.parse(AppContents.pdpWebsite));
                },
                child: const Text(
                  "GO TO WEBSITE",
                  style: TextStyle(fontSize: 18, color: AppColors.white),
                ),
              ),
            ),
          ],
        ));
  }
}

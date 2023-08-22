import 'package:flutter/material.dart';
import 'package:test_project/ui/widgets/global_button.dart';
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
    double width = MediaQuery.of(context).size.width;
    debugPrint("CURRENT SCREEN WIDTH:$width");
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
              "About university",
              style: TextStyle(
                  fontSize: 22,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              AppContents.pdpInfo,
              style: TextStyle(
                fontSize: width > 350 ? 18 : 14,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GlobalButton(
              text: "GO TO WEBSITE",
              onTap: () async {
                await launchUrl(Uri.parse(AppContents.pdpWebsite));
              })
        ],
      ),
    );
  }
}

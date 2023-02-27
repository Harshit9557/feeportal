import 'package:feeportal/view/navbar/drawer/about_us/about_us_normal_layout.dart';
import 'package:feeportal/view/navbar/drawer/about_us/about_us_wide_layout.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';

class AboutUsMainScreen extends StatefulWidget {
  const AboutUsMainScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsMainScreen> createState() => _AboutUsMainScreenState();
}

class _AboutUsMainScreenState extends State<AboutUsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: (defaultTargetPlatform == TargetPlatform.iOS ||
                defaultTargetPlatform == TargetPlatform.android)
            ? Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )
            : null,
        centerTitle: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 540) {
            return const AboutUsWideLayout();
          } else {
            return const AboutUsNormalLayout();
          }
        },
      ),
    );
  }
}

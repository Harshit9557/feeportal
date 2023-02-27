import 'package:feeportal/view/navbar/drawer/contact_us/contact_us_normal_layout.dart';
import 'package:feeportal/view/navbar/drawer/contact_us/contact_us_wide_layout.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';

class ContactUsMainScreen extends StatefulWidget {
  const ContactUsMainScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsMainScreen> createState() => _ContactUsMainScreenState();
}

class _ContactUsMainScreenState extends State<ContactUsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us',
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
            return const ContactUsWideLayout();
          } else {
            return const ContactUsNormalLayout();
          }
        },
      ),
    );
  }
}

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
        title: Text('Contact Us'),
        foregroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb
                ? Icons.arrow_back_ios
                : Icons.arrow_back_outlined,
          ),
        ),
        centerTitle: false,
      ),
    );
  }
}

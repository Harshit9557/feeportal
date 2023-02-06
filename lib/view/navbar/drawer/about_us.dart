import 'dart:io';

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
        title: Text('About Us'),
        foregroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back_outlined,
          ),
        ),
        centerTitle: false,
      ),
    );
  }
}
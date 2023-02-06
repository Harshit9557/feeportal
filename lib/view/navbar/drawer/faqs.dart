import 'dart:io';

import 'package:flutter/material.dart';

class FAQsMainScreen extends StatefulWidget {
  const FAQsMainScreen({Key? key}) : super(key: key);

  @override
  State<FAQsMainScreen> createState() => _FAQsMainScreenState();
}

class _FAQsMainScreenState extends State<FAQsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
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

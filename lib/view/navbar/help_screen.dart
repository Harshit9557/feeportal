import 'dart:io';

import 'package:flutter/material.dart';

class HelpMainScreen extends StatefulWidget {
  const HelpMainScreen({Key? key}) : super(key: key);

  @override
  State<HelpMainScreen> createState() => _HelpMainScreenState();
}

class _HelpMainScreenState extends State<HelpMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back_outlined,
          ),
        ),
        title: const Text(
          'Quick Support',
        ),
        centerTitle: false,
      ),
    );
  }
}

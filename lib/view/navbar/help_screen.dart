import 'package:flutter/foundation.dart';
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
        titleSpacing: 0,
        title: const Text(
          'Quick Support',
        ),
        centerTitle: false,
      ),
    );
  }
}

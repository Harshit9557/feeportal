import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';

class PrivacyPolicyMainScreen extends StatefulWidget {
  const PrivacyPolicyMainScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyMainScreen> createState() =>
      _PrivacyPolicyMainScreenState();
}

class _PrivacyPolicyMainScreenState extends State<PrivacyPolicyMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
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

import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';

class TermsAndConditionsMainScreen extends StatefulWidget {
  const TermsAndConditionsMainScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsMainScreen> createState() =>
      _TermsAndConditionsMainScreenState();
}

class _TermsAndConditionsMainScreenState
    extends State<TermsAndConditionsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
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

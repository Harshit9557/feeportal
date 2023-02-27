import 'package:feeportal/app/constants/color_constants.dart';
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
        title: const Text(
          'Terms & Conditions',
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            style: TextStyle(
              color: kSplashScreenColor,
              fontFamily: 'Poppins',
              fontSize: 10,
            ),
            textAlign: TextAlign.justify,
            textScaleFactor: 1.5,
          ),
        ),
      ),
    );
  }
}

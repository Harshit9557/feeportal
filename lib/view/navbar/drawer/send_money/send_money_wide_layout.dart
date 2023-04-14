import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SendMoneyWideLayout extends StatefulWidget {
  const SendMoneyWideLayout({Key? key}) : super(key: key);

  @override
  State<SendMoneyWideLayout> createState() => _SendMoneyWideLayoutState();
}

class _SendMoneyWideLayoutState extends State<SendMoneyWideLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send Money',
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
    );
  }
}

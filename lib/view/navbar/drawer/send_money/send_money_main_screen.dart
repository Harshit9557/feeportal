import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/view/authentication/login/login_main_screen.dart';
import 'package:feeportal/view/navbar/drawer/send_money/send_money_normal_layout.dart';
import 'package:feeportal/view/navbar/drawer/send_money/send_money_wide_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SendMoneyMainScreen extends StatefulWidget {
  const SendMoneyMainScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyMainScreen> createState() => _SendMoneyMainScreenState();
}

class _SendMoneyMainScreenState extends State<SendMoneyMainScreen> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance.currentUser?.uid;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: _auth != null
          ? LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return const SendMoneyWideLayout();
                } else {
                  return const SendMoneyNormalLayout();
                }
              },
            )
          : const LoginMainScreen(),
    );
  }
}

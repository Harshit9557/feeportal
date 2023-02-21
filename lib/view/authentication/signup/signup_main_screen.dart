import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/view/authentication/signup/signup_normal_layout.dart';
import 'package:feeportal/view/authentication/signup/signup_wide_layout.dart';
import 'package:flutter/material.dart';

class SignUpMainScreen extends StatefulWidget {
  const SignUpMainScreen({Key? key}) : super(key: key);

  @override
  State<SignUpMainScreen> createState() => _SignUpMainScreenState();
}

class _SignUpMainScreenState extends State<SignUpMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              'assets/icons/logo.png',
              height: 25,
              width: 25,
            ),
          ),
        ),
        titleSpacing: 0,
        title: const Text.rich(
          TextSpan(
            text: 'Pay',
            style: TextStyle(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: 'On',
                style: TextStyle(
                  color: kButtonHoverColor,
                ),
              )
            ],
          ),
        ),
        centerTitle: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return const SignUpWideLayout();
          } else {
            return const SignUpNormalLayout();
          }
        },
      ),
    );
  }
}

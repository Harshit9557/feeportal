import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/view/navbar/drawer/send_money/send_money_normal_layout.dart';
import 'package:feeportal/view/navbar/drawer/send_money/send_money_wide_layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SendMoneyMainScreen extends StatefulWidget {
  const SendMoneyMainScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyMainScreen> createState() => _SendMoneyMainScreenState();
}

class _SendMoneyMainScreenState extends State<SendMoneyMainScreen> {
  // bool isEmailHovered = false;
  // bool isPhoneHovered = false;
  // bool isFaxHovered = false;
  // bool isAboutUsHovered = false;
  // bool isFAQsHovered = false;
  // bool isTermsHovered = false;
  // bool isPrivacyPolicyHovered = false;
  // bool isHelpHovered = false;
  // bool isAllTransactionHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Profile',
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return const SendMoneyWideLayout();
          } else {
            return const SendMoneyNormalLayout();
          }
        },
      ),
    );
  }
}

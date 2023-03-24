import 'package:feeportal/app/constants/color_constants.dart';
import 'package:flutter/material.dart';

class AccountWideLayout extends StatefulWidget {
  const AccountWideLayout({Key? key}) : super(key: key);

  @override
  State<AccountWideLayout> createState() => _AccountWideLayoutState();
}

class _AccountWideLayoutState extends State<AccountWideLayout> {
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: device.width,
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF01C7B0),
                  Color(0xFF01AAA4),
                  Color(0xFF008493),
                  Color(0xFF046B89),
                  Color(0xFF015A80),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Pricing Plan',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: kSplashScreenColor,
                  ),
                  textScaleFactor: 1.5,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: device.width - 100,
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

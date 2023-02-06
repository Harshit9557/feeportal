import 'package:feeportal/app/components/navbar/app_drawer.dart';
import 'package:feeportal/app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PricingMainScreen extends StatefulWidget {
  const PricingMainScreen({Key? key}) : super(key: key);

  @override
  State<PricingMainScreen> createState() => _PricingMainScreenState();
}

class _PricingMainScreenState extends State<PricingMainScreen> {
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
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
                  Text(
                    'Pricing Plan',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: kSplashScreenColor,
                    ),
                    textScaleFactor: 1.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 80.w,
                    child: Text(
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
      ),
    );
  }
}

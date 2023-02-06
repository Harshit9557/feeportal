import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:flutter/material.dart';

class NoInternetNormalLayout extends StatefulWidget {
  const NoInternetNormalLayout({Key? key}) : super(key: key);

  @override
  State<NoInternetNormalLayout> createState() => _NoInternetNormalLayoutState();
}

class _NoInternetNormalLayoutState extends State<NoInternetNormalLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/icons/logo.png'),
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 36,
            ),
            const Text.rich(
              TextSpan(
                text: 'Pay',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w600,
                  color: kSplashScreenColor,
                ),
                children: [
                  TextSpan(
                    text: 'On',
                    style: TextStyle(
                      color: kButtonHoverColor,
                      fontSize: 40,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'You are not connected to the Internet. Please try again.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 60,
              width: 120,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRouter.splashRoute);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSplashScreenColor,
                ),
                child: const Text(
                  'RETRY',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

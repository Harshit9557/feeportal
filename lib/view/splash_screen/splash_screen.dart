// ignore_for_file: use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    _navigateToBuilderScreen();
  }

  _navigateToBuilderScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    final connectivityResult = await (Connectivity().checkConnectivity());
    if ((defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.linux ||
            defaultTargetPlatform == TargetPlatform.macOS) &&
        !kIsWeb) {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Navigator.of(context).pushReplacementNamed(
          AppRouter.navigationMainRoute,
        );
      } else {
        Navigator.of(context)
            .pushReplacementNamed(AppRouter.noInternetMainRoute);
      }
    } else {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Navigator.of(context).pushReplacementNamed(
          AppRouter.navigationMainRoute,
        );
      } else {
        Navigator.of(context)
            .pushReplacementNamed(AppRouter.noInternetMainRoute);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashScreenColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('assets/icons/logo.png'),
              height: animation.value * 100,
              width: animation.value * 100,
            ),
            const SizedBox(
              height: 36,
            ),
            Text.rich(
              TextSpan(
                text: 'Pay',
                style: TextStyle(
                  fontSize: animation.value * 40,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: 'On',
                    style: TextStyle(
                      color: kButtonHoverColor,
                      fontSize: animation.value * 40,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

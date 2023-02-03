// ignore_for_file: use_build_context_synchronously

import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  bool hasInternet = true;

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

    hasInternet = await InternetConnectionChecker().hasConnection;

    if (!hasInternet) {
      Navigator.of(context).pushReplacementNamed(
        AppRouter.navigationRoute,
      );
    } else {
      Navigator.of(context).pushReplacementNamed(AppRouter.noInternetRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashScreenColor.withOpacity(0.85),
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
            Text(
              'PayOn',
              style: TextStyle(
                fontSize: animation.value * 40,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

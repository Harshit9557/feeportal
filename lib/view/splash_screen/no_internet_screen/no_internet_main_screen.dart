import 'package:feeportal/view/splash_screen/no_internet_screen/normal_layout.dart';
import 'package:feeportal/view/splash_screen/no_internet_screen/wide_layout.dart';
import 'package:flutter/material.dart';

class NoInternetMainScreen extends StatelessWidget {
  const NoInternetMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return const NoInternetWideLayout();
        } else {
          return const NoInternetNormalLayout();
        }
      },
    );
  }
}

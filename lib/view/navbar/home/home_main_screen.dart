import 'package:feeportal/view/navbar/home/normal_layout.dart';
import 'package:feeportal/view/navbar/home/wide_layout.dart';
import 'package:flutter/material.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return HomeWideLayout();
        } else {
          return HomeNormalLayout();
        }
      },
    );
  }
}

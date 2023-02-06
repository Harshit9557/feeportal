import 'package:feeportal/app/components/navbar/app_drawer.dart';
import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:flutter/material.dart';

class HomeNormalLayout extends StatefulWidget {
  const HomeNormalLayout({Key? key}) : super(key: key);

  @override
  State<HomeNormalLayout> createState() => _HomeNormalLayoutState();
}

class _HomeNormalLayoutState extends State<HomeNormalLayout> {
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () => Navigator.pushNamed(context, AppRouter.helpMainRoute),
        child: const Icon(
          Icons.question_answer,
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
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
      endDrawer: const AppDrawer(),
      body: Column(
        children: [],
      ),
    );
  }
}

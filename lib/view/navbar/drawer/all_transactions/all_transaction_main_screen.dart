import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:feeportal/view/navbar/drawer/all_transactions/all_transactions_normal_layout.dart';
import 'package:feeportal/view/navbar/drawer/all_transactions/all_transactions_wide_layout.dart';
import 'package:feeportal/view/navbar/navigation_screen/normal_layout.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';

class AllTransactionsMainScreen extends StatefulWidget {
  const AllTransactionsMainScreen({Key? key}) : super(key: key);

  @override
  State<AllTransactionsMainScreen> createState() =>
      _AllTransactionsMainScreenState();
}

class _AllTransactionsMainScreenState extends State<AllTransactionsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'All Transactions',
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
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRouter.navigationMainRoute, (route) => false);
                  },
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
            return const AllTransactionsWideLayout();
          } else {
            return const AllTransactionsNormalLayout();
          }
        },
      ),
    );
  }
}

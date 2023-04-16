import 'package:feeportal/view/navbar/navigation_screen/normal_layout.dart';
import 'package:feeportal/view/navbar/navigation_screen/wide_layout.dart';
import 'package:flutter/material.dart';

bool isLoggedIn = false;

class NavigationMainScreen extends StatefulWidget {
  const NavigationMainScreen({Key? key}) : super(key: key);

  @override
  State<NavigationMainScreen> createState() => _NavigationMainScreenState();
}

class _NavigationMainScreenState extends State<NavigationMainScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    int? page = ModalRoute.of(context)!.settings.arguments as int?;
    setState(() => selectedIndex = page ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return const WideLayout();
          } else {
            return const NormalLayout();
          }
        },
      ),
    );
  }
}

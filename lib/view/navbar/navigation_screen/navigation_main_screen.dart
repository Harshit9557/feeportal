import 'package:feeportal/core/providers/auth_provider.dart';
import 'package:feeportal/view/navbar/navigation_screen/normal_layout.dart';
import 'package:feeportal/view/navbar/navigation_screen/wide_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool isLoggedIn = false;

class NavigationMainScreen extends StatefulWidget {
  const NavigationMainScreen({Key? key}) : super(key: key);

  @override
  State<NavigationMainScreen> createState() => _NavigationMainScreenState();
}

class _NavigationMainScreenState extends State<NavigationMainScreen> {
  Future<bool> initCache({required BuildContext context}) async {
    var auth = Provider.of<AuthProvider>(context, listen: false);
    if (await auth.tryAutoLogin()) {
      setState(() {
        isLoggedIn = true;
      });
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    initCache(context: context);
  }

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

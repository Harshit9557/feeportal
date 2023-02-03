import 'package:feeportal/core/providers/auth_provider.dart';
import 'package:feeportal/view/authentication/login/login_screen.dart';
import 'package:feeportal/view/navbar/account/account_screen.dart';
import 'package:feeportal/view/navbar/home/home_screen.dart';
import 'package:feeportal/view/navbar/navigation_screen/normal_layout.dart';
import 'package:feeportal/view/navbar/navigation_screen/wide_layout.dart';
import 'package:feeportal/view/navbar/pricing/pricing_screen.dart';
import 'package:feeportal/view/navbar/services/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool isLoggedIn = false;
final screens = [
  const HomeScreen(),
  const ServicesScreen(),
  const PricingScreen(),
  isLoggedIn ? const AccountScreen() : const LoginScreen(),
];

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
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
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return const WideLayout();
      } else {
        return const NormalLayout();
      }
    });
  }
}

import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/core/providers/auth_provider.dart';
import 'package:feeportal/view/authentication/login/login_screen.dart';
import 'package:feeportal/view/navbar/account/account_screen.dart';
import 'package:feeportal/view/navbar/home/home_screen.dart';
import 'package:feeportal/view/navbar/pricing/pricing_screen.dart';
import 'package:feeportal/view/navbar/services/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  bool isLoggedIn = false;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
    setState(() => _selectedIndex = page ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      ServicesScreen(),
      PricingScreen(),
      isLoggedIn ? const AccountScreen() : const LoginScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.miscellaneous_services),
            label: 'Services',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.price_change),
            label: 'Pricing',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
        backgroundColor: kSplashScreenColor.withOpacity(0.8),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      body: screens.elementAt(_selectedIndex),
    );
  }
}

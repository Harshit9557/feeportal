import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/view/authentication/login/login_main_screen.dart';
import 'package:feeportal/view/navbar/account/account_screen.dart';
import 'package:feeportal/view/navbar/home/home_main_screen.dart';
import 'package:feeportal/view/navbar/navigation_screen/navigation_main_screen.dart';
import 'package:feeportal/view/navbar/pricing/pricing_screen.dart';
import 'package:feeportal/view/navbar/services/services_screen.dart';
import 'package:flutter/material.dart';

int selectedIndex = 0;

class NormalLayout extends StatefulWidget {
  const NormalLayout({Key? key}) : super(key: key);

  @override
  State<NormalLayout> createState() => _NormalLayoutState();
}

class _NormalLayoutState extends State<NormalLayout> {
  final screens = [
    const HomeMainScreen(),
    const ServicesScreen(),
    const PricingMainScreen(),
    isLoggedIn ? const AccountScreen() : const LoginMainScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.price_change),
            label: 'Pricing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
        backgroundColor: kSplashScreenColor,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      body: screens.elementAt(selectedIndex),
    );
  }
}

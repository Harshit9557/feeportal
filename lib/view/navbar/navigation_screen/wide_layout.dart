import 'package:feeportal/app/components/navbar/side_navigation.dart';
import 'package:feeportal/view/authentication/login/login_main_screen.dart';
import 'package:feeportal/view/navbar/account/account_screen.dart';
import 'package:feeportal/view/navbar/home/home_main_screen.dart';
import 'package:feeportal/view/navbar/navigation_screen/navigation_main_screen.dart';
import 'package:feeportal/view/navbar/navigation_screen/normal_layout.dart';
import 'package:feeportal/view/navbar/pricing/pricing_screen.dart';
import 'package:feeportal/view/navbar/services/services_screen.dart';
import 'package:flutter/material.dart';

class WideLayout extends StatefulWidget {
  const WideLayout({Key? key}) : super(key: key);

  @override
  State<WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  final pageController =
      PageController(initialPage: selectedIndex, keepPage: true);

  final screens = [
    const HomeMainScreen(),
    const ServicesScreen(),
    const PricingMainScreen(),
    isLoggedIn ? const AccountScreen() : const LoginMainScreen(),
  ];

  final navItems = [
    SideNavigationItem(icon: Icons.home, title: "Home"),
    SideNavigationItem(icon: Icons.miscellaneous_services, title: "Services"),
    SideNavigationItem(icon: Icons.price_change, title: "Pricing"),
    SideNavigationItem(icon: Icons.account_circle_outlined, title: "Account"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          SideNavigation(
            navItems: this.navItems,
            itemSelected: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 3),
                curve: Curves.ease,
              );
            },
            initialIndex: selectedIndex,
            actions: screens,
          ),
          Expanded(
            child: PageView.builder(
              itemCount: 5,
              controller: pageController,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return screens.elementAt(selectedIndex);
              },
            ),
          )
        ],
      ),
    );
  }
}

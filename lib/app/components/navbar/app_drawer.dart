import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isHelpHovered = false;
  bool isAboutUsHovered = false;
  bool isContactUsHovered = false;
  bool isAllTransactionsHovered = false;
  bool isFAQsHovered = false;
  bool isTermsHovered = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: EdgeInsets.only(right: 20),
        height: 500,
        width: 300,
        decoration: const BoxDecoration(
          color: kSplashScreenColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(500, 800),
            bottomLeft: Radius.elliptical(800, 900),
            bottomRight: Radius.elliptical(200, 100),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Image.asset(
                      'assets/icons/logo.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text.rich(
                  TextSpan(
                    text: 'Pay',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: 'On',
                        style: TextStyle(
                          color: kButtonHoverColor,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            //transaction history
            MouseRegion(
              onHover: (_) {
                setState(() {
                  isAllTransactionsHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isAllTransactionsHovered = false;
                });
              },
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, AppRouter.allTransactionsMainRoute),
                child: Text(
                  'All Transactions',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: isAllTransactionsHovered
                        ? kButtonHoverColor
                        : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //faqs
            MouseRegion(
              onHover: (_) {
                setState(() {
                  isFAQsHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isFAQsHovered = false;
                });
              },
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.faqsMainRoute),
                child: Text(
                  'FAQs',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: isFAQsHovered ? kButtonHoverColor : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //about us
            MouseRegion(
              onHover: (_) {
                setState(() {
                  isAboutUsHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isAboutUsHovered = false;
                });
              },
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.aboutUsMainRoute),
                child: Text(
                  'About Us',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: isAboutUsHovered ? kButtonHoverColor : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //t&c us
            MouseRegion(
              onHover: (_) {
                setState(() {
                  isTermsHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isTermsHovered = false;
                });
              },
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.termsMainRoute),
                child: Text(
                  'T&C',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: isTermsHovered ? kButtonHoverColor : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //contact us
            MouseRegion(
              onHover: (_) {
                setState(() {
                  isContactUsHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isContactUsHovered = false;
                });
              },
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.contactUsMainRoute),
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color:
                        isContactUsHovered ? kButtonHoverColor : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //help button
            MouseRegion(
              onHover: (_) {
                setState(() {
                  isHelpHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isHelpHovered = false;
                });
              },
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.helpMainRoute),
                child: Text(
                  'Help',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: isHelpHovered ? kButtonHoverColor : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

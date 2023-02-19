import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:flutter/material.dart';

class HomeWideLayout extends StatefulWidget {
  const HomeWideLayout({Key? key}) : super(key: key);

  @override
  State<HomeWideLayout> createState() => _HomeWideLayoutState();
}

class _HomeWideLayoutState extends State<HomeWideLayout> {
  bool isHelpHovered = false;
  bool isAboutUsHovered = false;
  bool isContactUsHovered = false;
  bool isAllTransactionsHovered = false;
  bool isFAQsHovered = false;
  bool isTermsHovered = false;
  bool isPrivacyPolicyHovered = false;
  @override
  Widget build(BuildContext context) {
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
            style: TextStyle(
              color: Colors.white,
            ),
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
        actions: [
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
            child: Center(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, AppRouter.allTransactionsMainRoute),
                child: Center(
                  child: Text(
                    'All Transactions',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: isAllTransactionsHovered
                          ? kButtonHoverColor
                          : kButtonColor.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          //faqs us
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
            child: Center(
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.faqsMainRoute),
                child: Center(
                  child: Text(
                    'FAQs',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: isFAQsHovered
                          ? kButtonHoverColor
                          : kButtonColor.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
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
            child: Center(
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.aboutUsMainRoute),
                child: Center(
                  child: Text(
                    'About Us',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: isAboutUsHovered
                          ? kButtonHoverColor
                          : kButtonColor.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
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
            child: Center(
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.termsMainRoute),
                child: Center(
                  child: Text(
                    'T&C',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: isTermsHovered
                          ? kButtonHoverColor
                          : kButtonColor.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          //privacy Policy
          MouseRegion(
            onHover: (_) {
              setState(() {
                isPrivacyPolicyHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                isPrivacyPolicyHovered = false;
              });
            },
            child: Center(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, AppRouter.privacyPolicyMainRoute),
                child: Center(
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: isPrivacyPolicyHovered
                          ? kButtonHoverColor
                          : kButtonColor.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
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
            child: Center(
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.contactUsMainRoute),
                child: Center(
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: isContactUsHovered
                          ? kButtonHoverColor
                          : kButtonColor.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
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
            child: Center(
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.helpMainRoute),
                child: Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: isHelpHovered
                        ? kButtonHoverColor
                        : kButtonColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Center(
                    child: Text(
                      'Help',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

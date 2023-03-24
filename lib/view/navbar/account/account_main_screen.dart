import 'package:feeportal/app/components/navbar/app_drawer.dart';
import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:feeportal/view/navbar/account/account_normal_layout.dart';
import 'package:feeportal/view/navbar/account/account_wide_layout.dart';
import 'package:flutter/material.dart';

class AccountMainScreen extends StatefulWidget {
  const AccountMainScreen({Key? key}) : super(key: key);

  @override
  State<AccountMainScreen> createState() => _AccountMainScreenState();
}

class _AccountMainScreenState extends State<AccountMainScreen> {
  // bool isEmailHovered = false;
  // bool isPhoneHovered = false;
  // bool isFaxHovered = false;
  // bool isAboutUsHovered = false;
  // bool isFAQsHovered = false;
  // bool isTermsHovered = false;
  // bool isPrivacyPolicyHovered = false;
  // bool isHelpHovered = false;
  // bool isAllTransactionHovered = false;
  //for wide layout
  bool isHelpWideHovered = false;
  bool isAboutUsWideHovered = false;
  bool isContactUsHovered = false;
  bool isAllTransactionsHovered = false;
  bool isFAQsWideHovered = false;
  bool isTermsWideHovered = false;
  bool isPrivacyPolicyWideHovered = false;
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
        actions: device.width > 770
            ? [
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
                      isFAQsWideHovered = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isFAQsWideHovered = false;
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
                            color: isFAQsWideHovered
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
                      isAboutUsWideHovered = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isAboutUsWideHovered = false;
                    });
                  },
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, AppRouter.aboutUsMainRoute),
                      child: Center(
                        child: Text(
                          'About Us',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: isAboutUsWideHovered
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
                      isTermsWideHovered = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isTermsWideHovered = false;
                    });
                  },
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, AppRouter.termsMainRoute),
                      child: Center(
                        child: Text(
                          'T&C',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: isTermsWideHovered
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
                      isPrivacyPolicyWideHovered = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isPrivacyPolicyWideHovered = false;
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
                            color: isPrivacyPolicyWideHovered
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
                      onTap: () => Navigator.pushNamed(
                          context, AppRouter.contactUsMainRoute),
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
                      isHelpWideHovered = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isHelpWideHovered = false;
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
                          color: isHelpWideHovered
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
              ]
            : null,
      ),
      endDrawer: device.width <= 770 ? const AppDrawer() : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return const AccountWideLayout();
          } else {
            return const AccountNormalLayout();
          }
        },
      ),
    );
  }
}

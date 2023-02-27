import 'package:feeportal/app/components/navbar/app_drawer.dart';
import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:flutter/material.dart';

class HomeWideLayout extends StatefulWidget {
  const HomeWideLayout({Key? key}) : super(key: key);

  @override
  State<HomeWideLayout> createState() => _HomeWideLayoutState();
}

class _HomeWideLayoutState extends State<HomeWideLayout> {
  bool isHelpWideHovered = false;
  bool isAboutUsWideHovered = false;
  bool isContactUsHovered = false;
  bool isAllTransactionsHovered = false;
  bool isFAQsWideHovered = false;
  bool isTermsWideHovered = false;
  bool isPrivacyPolicyWideHovered = false;

  bool isEmailHovered = false;
  bool isPhoneHovered = false;
  bool isFaxHovered = false;
  bool isAboutUsHovered = false;
  bool isFAQsHovered = false;
  bool isTermsHovered = false;
  bool isPrivacyPolicyHovered = false;
  bool isHelpHovered = false;
  bool isAllTransactionHovered = false;

  List<bool> offerListStatus = [];
  List<bool> doListStatus = [];
  List offerIconList = const [
    Icon(Icons.payment),
    Icon(Icons.dashboard_outlined),
    Icon(Icons.payments_outlined),
    Icon(Icons.track_changes),
    Icon(Icons.credit_card),
    Icon(Icons.security),
    Icon(Icons.local_library),
  ];
  List doIconList = const [
    Icon(Icons.payment),
    Icon(Icons.business),
    Icon(Icons.group_work_outlined),
  ];
  List<String> offerList = [
    'Payment Management',
    'Personal Dashboard',
    'Integrated Payments',
    'Business Tracking',
    'Credit & Debit Card',
    'Secure Payments',
    'Platform Support',
  ];
  List<String> doList = [
    'Payment Solution',
    'Growth Business',
    'Connected People',
  ];
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: device.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 240,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF01C7B0),
                        Color(0xFF01AAA4),
                        Color(0xFF008493),
                        Color(0xFF046B89),
                        Color(0xFF015A80),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'PAYMENT GATEWAY',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          color: kSplashScreenColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textScaleFactor: 1.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Solution to your every transaction',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        textScaleFactor: 1.3,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla accumsan ornare nisl, eget suscipit enim imperdiet vitae. Sed quis nisi sed nibh.',
                        style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.start,
                        textScaleFactor: 1.5,
                      ),
                    ],
                  ),
                ),
                //what we do label
                Padding(
                  padding: EdgeInsets.only(
                      top: device.width < 950 ? 250 : 200, bottom: 10),
                  child: const Text(
                    'WHAT WE DO',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      color: kButtonColor,
                    ),
                    textScaleFactor: 1.5,
                  ),
                ),
                //get ready label
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Get Ready To Have Best Smart Payments in The World',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: kSplashScreenColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textScaleFactor: 1.2,
                    textAlign: TextAlign.center,
                  ),
                ),
                //description label
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec.',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: kSplashScreenColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textScaleFactor: 1.2,
                    textAlign: TextAlign.center,
                  ),
                ),
                //doList
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Wrap(
                    children: List.generate(doList.length, (index) {
                      doListStatus.add(false);
                      return MouseRegion(
                        onHover: (_) {
                          setState(() {
                            doListStatus[index] = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            doListStatus[index] = false;
                          });
                        },
                        child: Container(
                          height: 280,
                          width: 250,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          decoration: BoxDecoration(
                            color: doListStatus[index]
                                ? kButtonHoverColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: kTextColor.withOpacity(0.13),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kTextColor.withOpacity(0.13),
                                offset: Offset.zero,
                                blurRadius: 5.0,
                                spreadRadius: 5.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              doIconList[index],
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                doList[index],
                                style: TextStyle(
                                  color: doListStatus[index]
                                      ? Colors.white
                                      : kSplashScreenColor,
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Lorem ipsum dolor sit ametcon sec tetur adipiscing elit sed do eiusmod tempor in cididod temunt.',
                                style: TextStyle(
                                  color: doListStatus[index]
                                      ? Colors.white
                                      : kSplashScreenColor.withOpacity(0.6),
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: doListStatus[index]
                                      ? Color(0xFFFF4A4A)
                                      : kSplashScreenColor.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Text(
                                    'More',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      color: doListStatus[index]
                                          ? Colors.white
                                          : kTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                //what we offer label
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  child: Text(
                    'WHAT WE OFFER',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      color: kButtonColor,
                    ),
                    textScaleFactor: 1.5,
                  ),
                ),
                //get ready label
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Get Ready To Have Best Smart Payments in The World',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: kSplashScreenColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textScaleFactor: 1.2,
                    textAlign: TextAlign.center,
                  ),
                ),
                //description label
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec.',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: kSplashScreenColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textScaleFactor: 1.2,
                    textAlign: TextAlign.center,
                  ),
                ),
                //offer list
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Wrap(
                    children: List.generate(offerList.length, (index) {
                      offerListStatus.add(false);
                      return MouseRegion(
                        onHover: (_) {
                          setState(() {
                            offerListStatus[index] = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            offerListStatus[index] = false;
                          });
                        },
                        child: Container(
                          height: 280,
                          width: 250,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          decoration: BoxDecoration(
                            color: offerListStatus[index]
                                ? kButtonHoverColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: kTextColor.withOpacity(0.13),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kTextColor.withOpacity(0.13),
                                offset: Offset.zero,
                                blurRadius: 5.0,
                                spreadRadius: 5.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              offerIconList[index],
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                offerList[index],
                                style: TextStyle(
                                  color: offerListStatus[index]
                                      ? Colors.white
                                      : kSplashScreenColor,
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Lorem ipsum dolor sit ametcon sec tetur adipiscing elit sed do eiusmod tempor in cididod temunt.',
                                style: TextStyle(
                                  color: offerListStatus[index]
                                      ? Colors.white
                                      : kSplashScreenColor.withOpacity(0.6),
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: offerListStatus[index]
                                      ? Color(0xFFFF4A4A)
                                      : kSplashScreenColor.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Text(
                                    'More',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      color: offerListStatus[index]
                                          ? Colors.white
                                          : kTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  padding: const EdgeInsets.fromLTRB(60, 50, 60, 20),
                  width: device.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF01C7B0),
                        Color(0xFF01AAA4),
                        Color(0xFF008493),
                        Color(0xFF046B89),
                        Color(0xFF015A80),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Image.asset(
                                        'assets/icons/logo.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                  const Text.rich(
                                    TextSpan(
                                      text: 'Pay',
                                      style: TextStyle(
                                        color: kSplashScreenColor,
                                        fontSize: 28,
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
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                width: 230,
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipisc ing elitsed do eiusmod tempororem ipsum dolor sit am econsect ametconsectetetur.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                'assets/images/payment_gateway_logo.png',
                                height: 50,
                              ),
                            ],
                          ),
                          device.width > 750
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Important Links',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Rubik',
                                          color: kSplashScreenColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Container(
                                          height: 2,
                                          width: 50,
                                          color: kLoginContainerColor,
                                        ),
                                      ),
                                      // all transaction
                                      MouseRegion(
                                        onHover: (_) {
                                          setState(() {
                                            isAllTransactionHovered = true;
                                          });
                                        },
                                        onExit: (_) {
                                          setState(() {
                                            isAllTransactionHovered = false;
                                          });
                                        },
                                        child: GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context,
                                              AppRouter
                                                  .allTransactionsMainRoute),
                                          child: Text(
                                            'All Transactions',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              color: isAllTransactionHovered
                                                  ? kButtonHoverColor
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      // about us
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
                                          onTap: () => Navigator.pushNamed(
                                              context,
                                              AppRouter.aboutUsMainRoute),
                                          child: Text(
                                            'About US',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              color: isAboutUsHovered
                                                  ? kButtonHoverColor
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      // faqs
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
                                          onTap: () => Navigator.pushNamed(
                                              context, AppRouter.faqsMainRoute),
                                          child: Text(
                                            'FAQs',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              color: isFAQsHovered
                                                  ? kButtonHoverColor
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      // t&c
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
                                          onTap: () => Navigator.pushNamed(
                                              context,
                                              AppRouter.termsMainRoute),
                                          child: Text(
                                            'T&C',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              color: isTermsHovered
                                                  ? kButtonHoverColor
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      // privacy
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
                                        child: GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context,
                                              AppRouter.privacyPolicyMainRoute),
                                          child: Text(
                                            'Privacy Policy',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              color: isPrivacyPolicyHovered
                                                  ? kButtonHoverColor
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      // help
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
                                          onTap: () => Navigator.pushNamed(
                                              context, AppRouter.helpMainRoute),
                                          child: Text(
                                            'Quick Support',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              color: isHelpHovered
                                                  ? kButtonHoverColor
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(
                                  width: 0,
                                ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Get in Touch',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Rubik',
                                    color: kSplashScreenColor,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Container(
                                    height: 2,
                                    width: 50,
                                    color: kLoginContainerColor,
                                  ),
                                ),
                                // email
                                MouseRegion(
                                  onHover: (_) {
                                    setState(() {
                                      isEmailHovered = true;
                                    });
                                  },
                                  onExit: (_) {
                                    setState(() {
                                      isEmailHovered = false;
                                    });
                                  },
                                  child: Text(
                                    'Email: info@payon.com',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: isEmailHovered
                                          ? kButtonHoverColor
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                //phone
                                MouseRegion(
                                  onHover: (_) {
                                    setState(() {
                                      isPhoneHovered = true;
                                    });
                                  },
                                  onExit: (_) {
                                    setState(() {
                                      isPhoneHovered = false;
                                    });
                                  },
                                  child: Text(
                                    'Phone: +91 9876543210',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: isPhoneHovered
                                          ? kButtonHoverColor
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                //fax
                                MouseRegion(
                                  onHover: (_) {
                                    setState(() {
                                      isFaxHovered = true;
                                    });
                                  },
                                  onExit: (_) {
                                    setState(() {
                                      isFaxHovered = false;
                                    });
                                  },
                                  child: Text(
                                    'Fax: +91 (987) 654 321 0',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: isFaxHovered
                                          ? kButtonHoverColor
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // Row(
                                //   children: [
                                //     MouseRegion(
                                //       onHover: (_) {
                                //         setState(() {
                                //           isFacebookHovered = true;
                                //         });
                                //       },
                                //       onExit: (_) {
                                //         setState(() {
                                //           isFacebookHovered = false;
                                //         });
                                //       },
                                //       child: Icon(
                                //         Icons.facebook,
                                //         size: 30,
                                //         color: isFacebookHovered
                                //             ? Colors.blue
                                //             : kTextColor.withOpacity(0.2),
                                //       ),
                                //     ),
                                //     MouseRegion(
                                //       onHover: (_) {
                                //         setState(() {
                                //           isFacebookHovered = true;
                                //         });
                                //       },
                                //       onExit: (_) {
                                //         setState(() {
                                //           isFacebookHovered = false;
                                //         });
                                //       },
                                //       child: Icon(
                                //         Icons.,
                                //         size: 30,
                                //         color: isFacebookHovered
                                //             ? Colors.blue
                                //             : kTextColor.withOpacity(0.2),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Center(
                        child: Text(
                          'Copyright @2023 PayOn. All Rights Reserved',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          textScaleFactor: 1.2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 200,
              right: 20,
              left: 20,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    offset: Offset.zero,
                    color: Colors.grey.shade300,
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                  ),
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'WELCOME TO PAYON',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        color: kButtonHoverColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textScaleFactor: 1.5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Leading, Trusted. Enabling growth.',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          color: kSplashScreenColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textScaleFactor: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.',
                      style: TextStyle(
                        fontSize: 9,
                        fontFamily: 'Poppins',
                        color: kSplashScreenColor,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                      textScaleFactor: 1.5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Integer convallis massa metus, a ultricies tortor hendrerit in. Aenean et condimentum ligula. Sed eget vulputate ante. Suspendisse potenti. Nam gravida gravida pharetra. Vestibulum ultricies odio metus, a consectetur turpis pretium vel. Mauris pulvinar et felis at mollis.',
                      style: TextStyle(
                        fontSize: 9,
                        fontFamily: 'Poppins',
                        color: kSplashScreenColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

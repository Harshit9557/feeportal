import 'package:feeportal/app/components/navbar/app_drawer.dart';
import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PricingMainScreen extends StatefulWidget {
  const PricingMainScreen({Key? key}) : super(key: key);

  @override
  State<PricingMainScreen> createState() => _PricingMainScreenState();
}

class _PricingMainScreenState extends State<PricingMainScreen> {
  Map<String, String> priceList = {
    "Bank Transfer": "*Fees (excl VAT)",
    "e-Wallet": "*Need Verification",
    "Credit Card": "*Fees (excl VAT)",
    "Cardless Credit": "*Account Must be registered",
  };
  List<bool> priceListStatus = [];

  bool isEmailHovered = false;
  bool isPhoneHovered = false;
  bool isFaxHovered = false;
  bool isAboutUsHovered = false;
  bool isFAQsHovered = false;
  bool isTermsHovered = false;
  bool isPrivacyPolicyHovered = false;
  bool isHelpHovered = false;
  bool isAllTransactionHovered = false;
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
      ),
      endDrawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: device.width,
              height: 200,
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
                children: [
                  const Text(
                    'Pricing Plan',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: kSplashScreenColor,
                    ),
                    textScaleFactor: 1.5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 80.w,
                    child: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      textScaleFactor: 1.3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                'PLAN AND PRICING',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  color: kButtonColor,
                ),
                textScaleFactor: 1.5,
              ),
            ),
            SizedBox(
              width: 60.w,
              child: Text(
                'Helps You Make Smart Financial Choices',
                style: TextStyle(
                  fontSize: 4.w,
                  fontFamily: 'Poppins',
                  color: kSplashScreenColor,
                ),
                textScaleFactor: 1.2,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: priceList.length,
              itemBuilder: (context, index) {
                priceListStatus.add(false);
                return LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 547) {
                      return MouseRegion(
                        onHover: (_) {
                          setState(() {
                            priceListStatus[index] = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            priceListStatus[index] = false;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                            color: priceListStatus[index]
                                ? kButtonHoverColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: priceListStatus[index]
                                    ? kButtonHoverColor
                                    : kTextColor.withOpacity(0.2)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    priceList.keys.elementAt(index),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: priceListStatus[index]
                                          ? Colors.white
                                          : kSplashScreenColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      priceList.values.elementAt(index),
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        color: priceListStatus[index]
                                            ? Colors.white
                                            : kTextColor.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Online payment',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: priceListStatus[index]
                                          ? Colors.white
                                          : kSplashScreenColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '3.5% plus USD 1.00',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      color: priceListStatus[index]
                                          ? Colors.white
                                          : kTextColor.withOpacity(0.4),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Payout',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: priceListStatus[index]
                                          ? Colors.white
                                          : kSplashScreenColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '3.5% plus USD 1.00',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      color: priceListStatus[index]
                                          ? Colors.white
                                          : kTextColor.withOpacity(0.4),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/images/payment_gateway_logo.png',
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return MouseRegion(
                        onHover: (_) {
                          setState(() {
                            priceListStatus[index] = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            priceListStatus[index] = false;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                            color: priceListStatus[index]
                                ? kButtonHoverColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: priceListStatus[index]
                                    ? kButtonHoverColor
                                    : kTextColor.withOpacity(0.2)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        priceList.keys.elementAt(index),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          color: priceListStatus[index]
                                              ? Colors.white
                                              : kSplashScreenColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        priceList.values.elementAt(index),
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                          color: priceListStatus[index]
                                              ? Colors.white
                                              : kTextColor.withOpacity(0.4),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Online payment',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          color: priceListStatus[index]
                                              ? Colors.white
                                              : kSplashScreenColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '3.5% plus USD 1.00',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                          color: priceListStatus[index]
                                              ? Colors.white
                                              : kTextColor.withOpacity(0.4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Payout',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          color: priceListStatus[index]
                                              ? Colors.white
                                              : kSplashScreenColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '3.5% plus USD 1.00',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                          color: priceListStatus[index]
                                              ? Colors.white
                                              : kTextColor.withOpacity(0.4),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Image.asset(
                                    'assets/images/payment_gateway_logo.png',
                                    height: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
            ),
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 540) {
                return Container(
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
                          constraints.maxWidth > 750
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
                );
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Container(
                        height: 1,
                        width: 80.w,
                        color: kTextColor.withOpacity(0.2),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image.asset(
                                'assets/icons/logo.png',
                                height: 50,
                                width: 50,
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
                        SizedBox(
                          width: 80.w,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipisc ing elitsed do eiusmod tempororem ipsum dolor sit am econsect ametconsectetetur.',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              color: kSplashScreenColor.withOpacity(0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          'assets/images/payment_gateway_logo.png',
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Container(
                            height: 2,
                            width: 50,
                            color: kLoginContainerColor,
                          ),
                        ),
                        const Text(
                          'Get in Touch',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Rubik',
                            color: kSplashScreenColor,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                                  ? kButtonHoverColor.withOpacity(0.7)
                                  : kButtonColor,
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
                                  ? kButtonHoverColor.withOpacity(0.7)
                                  : kButtonColor,
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
                                  ? kButtonHoverColor.withOpacity(0.7)
                                  : kButtonColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Container(
                      width: device.width,
                      height: 40,
                      color: kSplashScreenColor,
                      child: const Center(
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
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

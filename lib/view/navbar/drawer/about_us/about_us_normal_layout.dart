import 'package:feeportal/app/constants/color_constants.dart';
import 'package:flutter/material.dart';

class AboutUsNormalLayout extends StatefulWidget {
  const AboutUsNormalLayout({Key? key}) : super(key: key);

  @override
  State<AboutUsNormalLayout> createState() => _AboutUsNormalLayoutState();
}

class _AboutUsNormalLayoutState extends State<AboutUsNormalLayout> {
  bool isEmailHovered = false;
  bool isPhoneHovered = false;
  bool isFaxHovered = false;
  List<String> doList = [
    'Payment Solution',
    'Growth Business',
    'Connected People',
  ];
  List doIconList = const [
    Icon(Icons.payment),
    Icon(Icons.business),
    Icon(Icons.group_work_outlined),
  ];
  List<bool> doListStatus = [];
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                //gradient container
                Container(
                  width: device.width,
                  height: 270,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        textAlign: TextAlign.start,
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
                      top: device.width < 420 ? 380 : 300, bottom: 10),
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Container(
                        height: 1,
                        width: 80,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                ),
              ],
            ),
            Positioned(
              top: 230,
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

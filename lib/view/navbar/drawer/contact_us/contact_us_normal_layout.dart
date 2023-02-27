import 'package:feeportal/app/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ContactUsNormalLayout extends StatefulWidget {
  const ContactUsNormalLayout({Key? key}) : super(key: key);

  @override
  State<ContactUsNormalLayout> createState() => _ContactUsNormalLayoutState();
}

class _ContactUsNormalLayoutState extends State<ContactUsNormalLayout> {
  bool isEmailHovered = false;
  bool isPhoneHovered = false;
  bool isFaxHovered = false;
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image container
            Stack(
              children: [
                Container(
                  width: device.width,
                  height: 270,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(
                        'assets/images/contact.jpg',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'CONTACT US',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          color: kButtonColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textScaleFactor: 1.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Get In Touch',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        textScaleFactor: 1.3,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
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
      ),
    );
  }
}

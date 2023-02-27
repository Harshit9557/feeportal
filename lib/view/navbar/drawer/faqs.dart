import 'package:feeportal/app/constants/color_constants.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';

class FAQsMainScreen extends StatefulWidget {
  const FAQsMainScreen({Key? key}) : super(key: key);

  @override
  State<FAQsMainScreen> createState() => _FAQsMainScreenState();
}

class _FAQsMainScreenState extends State<FAQsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'FAQs',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: (defaultTargetPlatform == TargetPlatform.iOS ||
                defaultTargetPlatform == TargetPlatform.android)
            ? Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )
            : null,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              //services tile
              ExpansionTile(
                iconColor: kSplashScreenColor,
                title: Text(
                  'Q: What are the services provided by you?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kSplashScreenColor,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'A: You can refer services page',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kButtonColor,
                      ),
                    ),
                  )
                ],
              ),
              //pricing tile
              ExpansionTile(
                iconColor: kSplashScreenColor,
                title: Text(
                  'Q: What is your pricing plan?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kSplashScreenColor,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'A: You can refer pricing page',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kButtonColor,
                      ),
                    ),
                  )
                ],
              ),
              //help section
              ExpansionTile(
                iconColor: kSplashScreenColor,
                title: Text(
                  'Q: How to seek help or any kind of support regarding any information or troubleshooting?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kSplashScreenColor,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'A: Go to home page and click the floating action button; from there, assistance will be provided.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kButtonColor,
                      ),
                    ),
                  )
                ],
              ),
              //payment failure
              ExpansionTile(
                iconColor: kSplashScreenColor,
                title: Text(
                  'Q: How to get help in case of online payment failure?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kSplashScreenColor,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'A: You can contact us through contact page or can ask help using help button',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kButtonColor,
                      ),
                    ),
                  )
                ],
              ),
              //payment mode
              ExpansionTile(
                iconColor: kSplashScreenColor,
                title: Text(
                  'Q: What forms of payment do you accept?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kSplashScreenColor,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'A: We accept all type of payment mode.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kButtonColor,
                      ),
                    ),
                  )
                ],
              ),
              //contact
              ExpansionTile(
                iconColor: kSplashScreenColor,
                title: Text(
                  'Q: How can I contact customer service?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kSplashScreenColor,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'A: You can contact our customer service team by email, phone or fax',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kButtonColor,
                      ),
                    ),
                  )
                ],
              ),
              //all transactions
              ExpansionTile(
                iconColor: kSplashScreenColor,
                title: Text(
                  'Q: How can I see my transaction?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kSplashScreenColor,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'A: You can see your all transaction history in All Transactions page',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kButtonColor,
                      ),
                    ),
                  )
                ],
              ),
              //terms
              ExpansionTile(
                iconColor: kSplashScreenColor,
                title: Text(
                  'Q: What are your Terms & Conditions?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kSplashScreenColor,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'A: You can refer to T&C page',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kButtonColor,
                      ),
                    ),
                  )
                ],
              ),
              //policy
              ExpansionTile(
                iconColor: kSplashScreenColor,
                title: Text(
                  'Q: What is your Privacy Policy?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kSplashScreenColor,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'A: You can refer to Privacy Policy page',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kButtonColor,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

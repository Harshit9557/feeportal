import 'package:another_flushbar/flushbar.dart';
import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:feeportal/core/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountNormalLayout extends StatefulWidget {
  const AccountNormalLayout({Key? key}) : super(key: key);

  @override
  State<AccountNormalLayout> createState() => _AccountNormalLayoutState();
}

class _AccountNormalLayoutState extends State<AccountNormalLayout> {
  _showMessage(String message) {
    Flushbar(
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.all(10),
      backgroundColor: kSplashScreenColor,
      boxShadows: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      message: message,
    ).show(context);
  }

  _deleteAccount() async {
    FocusScope.of(context).unfocus();
    final prov = Provider.of<AuthProvider>(context, listen: false);
    await prov.deleteAccount().then((value) {
      value
          ? Navigator.pushNamedAndRemoveUntil(
              context, AppRouter.navigationMainRoute, (route) => false)
          : _showMessage('Something went wrong. Please try again later!');
    });
  }

  bool _deleteButtonDisable = false;
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: kSplashScreenColor,
                    ),
                    textScaleFactor: 1.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    textScaleFactor: 1.3,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(17, 3, 23, 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    width: double.infinity,
                    height: 1,
                    color: kDrawerColor,
                  ),
                  //profile
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Navigator.of(context)
                            .pushNamed(AppRouter.profileMainRoute),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Profile',
                                  style: TextStyle(
                                    color: kWishlistListColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  'Check Profile Details',
                                  style: TextStyle(
                                    color: kSplashScreenColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_right,
                              color: kWishlistListColor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 7, bottom: 10),
                        width: double.infinity,
                        height: 1,
                        color: kDrawerColor,
                      )
                    ],
                  ),
                  //your transactions
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () =>
                            Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRouter.allTransactionsMainRoute,
                          (route) => false,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Your Transactions',
                                  style: TextStyle(
                                    color: kWishlistListColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  'Manage Your Orders',
                                  style: TextStyle(
                                    color: kSplashScreenColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_right,
                              color: kWishlistListColor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 7, bottom: 10),
                        width: double.infinity,
                        height: 1,
                        color: kDrawerColor,
                      )
                    ],
                  ),
                  //logout
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: const Text(
                                'Proceed to Logout?',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: kWishlistListColor,
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text(
                                    'NO',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: kWishlistListColor,
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () async {
                                    await auth.logOut().then((value) {
                                      Navigator.pushReplacementNamed(context,
                                          AppRouter.navigationMainRoute);
                                    });
                                  },
                                  child: const Text(
                                    'YES',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: kButtonColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: kWishlistListColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  'Exit Plypicker',
                                  style: TextStyle(
                                    color: kSplashScreenColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_right,
                              color: kWishlistListColor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 7, bottom: 10),
                        width: double.infinity,
                        height: 1,
                        color: kDrawerColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              color: kDrawerColor,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(17, 10, 13, 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //faqs
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRouter.faqsMainRoute),
                    child: SizedBox(
                      width: device.width,
                      child: const Text(
                        'FAQs',
                        style: TextStyle(
                          color: kWishlistListColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                    ),
                    width: double.infinity,
                    height: 1,
                    color: kDrawerColor,
                  ),
                  //privacy policy
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRouter.privacyPolicyMainRoute),
                    child: SizedBox(
                      width: device.width,
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: kWishlistListColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                    ),
                    width: double.infinity,
                    height: 1,
                    color: kDrawerColor,
                  ),
                  // Terms & Conditions
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRouter.termsMainRoute),
                    child: SizedBox(
                      width: device.width,
                      child: const Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: kWishlistListColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                    ),
                    width: double.infinity,
                    height: 1,
                    color: kDrawerColor,
                  ),
                  //Delete Account
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text(
                            'Proceed to Delete Account?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: kWishlistListColor,
                            ),
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text(
                                'NO',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: kWishlistListColor,
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () async {
                                if (_deleteButtonDisable == false) {
                                  setState(() {
                                    _deleteButtonDisable = true;
                                  });
                                  await _deleteAccount();
                                  await Future.delayed(
                                      const Duration(seconds: 1));
                                  setState(() {
                                    _deleteButtonDisable = false;
                                  });
                                }
                              },
                              child: const Text(
                                'YES',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: kLoginContainerColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: SizedBox(
                      width: device.width,
                      child: const Text(
                        'Delete Account',
                        style: TextStyle(
                          color: kWishlistListColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

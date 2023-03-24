import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:feeportal/core/providers/auth_provider.dart';
import 'package:feeportal/view/navbar/navigation_screen/navigation_main_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWideLayout extends StatefulWidget {
  const LoginWideLayout({Key? key}) : super(key: key);

  @override
  State<LoginWideLayout> createState() => _LoginWideLayoutState();
}

class _LoginWideLayoutState extends State<LoginWideLayout> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isHidden = true;
  bool isLoginHovered = false;
  bool isMailHovered = false;
  bool isPasswordHovered = false;
  bool isRegisterHovered = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _showMessage(String message) {
    return Flushbar(
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

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    final loginResponse = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: device.height,
              color: kSplashScreenColor,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset('assets/images/login.png'),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            width: device.width / 2.5,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/icons/logo.png'),
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      const Text.rich(
                        TextSpan(
                          text: 'Pay',
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w600,
                            color: kSplashScreenColor,
                          ),
                          children: [
                            TextSpan(
                              text: 'On',
                              style: TextStyle(
                                color: kButtonHoverColor,
                                fontSize: 40,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      MouseRegion(
                        onHover: (_) {
                          setState(() {
                            isMailHovered = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            isMailHovered = false;
                          });
                        },
                        child: TextFormField(
                          cursorColor: kSplashScreenColor,
                          keyboardType: TextInputType.emailAddress,
                          controller: mailController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Mail ID';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Your Mail ID',
                            hintStyle: TextStyle(
                              color: kTextColor.withOpacity(0.5),
                              fontSize: 13,
                            ),
                            prefixIcon: const Icon(
                              Icons.mail_outline_rounded,
                              color: kSplashScreenColor,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isMailHovered
                                      ? kButtonHoverColor
                                      : kButtonColor),
                              gapPadding: 10,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isMailHovered
                                      ? kButtonHoverColor
                                      : kButtonColor),
                              gapPadding: 10,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isMailHovered
                                      ? kButtonHoverColor
                                      : kButtonColor),
                              gapPadding: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MouseRegion(
                        onHover: (_) {
                          setState(() {
                            isPasswordHovered = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            isPasswordHovered = false;
                          });
                        },
                        child: TextFormField(
                          cursorColor: kSplashScreenColor,
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          obscureText: isHidden,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Your password',
                            hintStyle: TextStyle(
                              color: kTextColor.withOpacity(0.5),
                              fontSize: 13,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            prefixIcon: Icon(
                              isHidden
                                  ? Icons.lock_outline_rounded
                                  : Icons.lock_open_rounded,
                              color: kSplashScreenColor,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () => setState(() {
                                isHidden = !isHidden;
                              }),
                              child: Icon(
                                isHidden
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: kSplashScreenColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isPasswordHovered
                                      ? kButtonHoverColor
                                      : kButtonColor),
                              gapPadding: 10,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isPasswordHovered
                                      ? kButtonHoverColor
                                      : kButtonColor),
                              gapPadding: 10,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isPasswordHovered
                                      ? kButtonHoverColor
                                      : kButtonColor),
                              gapPadding: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        height: 60,
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (EmailValidator.validate(
                                  mailController.text)) {
                                await loginResponse
                                    .login(mailController.text,
                                        passwordController.text)
                                    .then((value) {
                                  final response = jsonDecode(value.body);
                                  print(response);
                                  if (response.toString().contains('error')) {
                                    _showMessage("InValid Email ID/Password");
                                  } else {
                                    setState(() {
                                      isLoggedIn = true;
                                    });
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      AppRouter.navigationMainRoute,
                                      ModalRoute.withName(
                                          AppRouter.navigationMainRoute),
                                      arguments: 3,
                                    );
                                  }
                                });
                              } else {
                                _showMessage("Enter Valid Email ID");
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kSplashScreenColor,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Didn\'t have an account? ',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            color: kSplashScreenColor.withOpacity(0.7),
                          ),
                          children: [
                            TextSpan(
                              text: 'Register',
                              style: TextStyle(
                                color: isRegisterHovered
                                    ? kButtonHoverColor
                                    : kButtonColor,
                                fontSize: 14,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context)
                                    .pushNamed(AppRouter.signUPMainRoute),
                              onEnter: (_) {
                                setState(() {
                                  isRegisterHovered = true;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  isRegisterHovered = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

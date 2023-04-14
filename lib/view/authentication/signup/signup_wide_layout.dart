import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpWideLayout extends StatefulWidget {
  const SignUpWideLayout({Key? key}) : super(key: key);

  @override
  State<SignUpWideLayout> createState() => _SignUpWideLayoutState();
}

class _SignUpWideLayoutState extends State<SignUpWideLayout> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  bool isHidden = true;
  bool isMailHovered = false;
  bool isPasswordHovered = false;
  bool isNameHovered = false;
  bool isPhoneHovered = false;
  bool isLoginHovered = false;
  String completeNo = "";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _signUP(String email, String password, BuildContext context, String name,
      String phone) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser?.updateEmail(email);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'email': email,
        'password': password,
        'name': name,
        'phone': phone
      }).whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration Successful'),
          ),
        );
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRouter.navigationMainRoute,
          ModalRoute.withName(AppRouter.navigationMainRoute),
          arguments: 3,
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password is too weak'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email Already Exists'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
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
                      const SizedBox(
                        height: 30,
                      ),
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
                      //name
                      MouseRegion(
                        onHover: (_) {
                          setState(() {
                            isNameHovered = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            isNameHovered = false;
                          });
                        },
                        child: TextFormField(
                          cursorColor: kSplashScreenColor,
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'Please Enter Your Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Your Name',
                            hintStyle: TextStyle(
                              color: kTextColor.withOpacity(0.5),
                              fontSize: 13,
                            ),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: kSplashScreenColor,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isNameHovered
                                      ? kButtonHoverColor
                                      : kButtonColor),
                              gapPadding: 10,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isNameHovered
                                      ? kButtonHoverColor
                                      : kButtonColor),
                              gapPadding: 10,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isNameHovered
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
                      //email
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
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
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
                              Icons.email_outlined,
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
                        child: IntlPhoneField(
                          textAlignVertical: const TextAlignVertical(y: 0.4),
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            completeNo = phone.completeNumber;
                          },
                          dropdownIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: kSplashScreenColor,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hoverColor: Colors.white,
                            hintText: 'Enter Your Mobile No',
                            hintStyle: TextStyle(
                              color: kTextColor.withOpacity(0.5),
                              fontSize: 13,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 13,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isPhoneHovered
                                      ? kButtonHoverColor
                                      : kButtonColor),
                              gapPadding: 10,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isPhoneHovered
                                      ? kButtonHoverColor
                                      : kButtonColor),
                              gapPadding: 10,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isPhoneHovered
                                      ? kButtonHoverColor
                                      : kButtonColor),
                              gapPadding: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      //password
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
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _signUP(
                                  mailController.text.trim(),
                                  passwordController.text.trim(),
                                  context,
                                  nameController.text.trim(),
                                  completeNo);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kSplashScreenColor,
                          ),
                          child: const Text(
                            'Register',
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
                          text: 'Already have an account? ',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            color: kSplashScreenColor.withOpacity(0.7),
                          ),
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: isLoginHovered
                                    ? kButtonHoverColor
                                    : kButtonColor,
                                fontSize: 14,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context)
                                    .pushNamedAndRemoveUntil(
                                        AppRouter.navigationMainRoute,
                                        ModalRoute.withName(
                                            AppRouter.navigationMainRoute),
                                        arguments: 3),
                              onEnter: (_) {
                                setState(() {
                                  isLoginHovered = true;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  isLoginHovered = false;
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

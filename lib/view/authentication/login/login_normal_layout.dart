import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:feeportal/view/navbar/navigation_screen/navigation_main_screen.dart';
import 'package:flutter/material.dart';

class LoginNormalLayout extends StatefulWidget {
  const LoginNormalLayout({Key? key}) : super(key: key);

  @override
  State<LoginNormalLayout> createState() => _LoginNormalLayoutState();
}

class _LoginNormalLayoutState extends State<LoginNormalLayout> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  bool isHidden = true;
  bool isLoginHovered = false;
  bool isIDHovered = false;
  bool isPasswordHovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  isIDHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isIDHovered = false;
                });
              },
              child: TextFormField(
                cursorColor: kSplashScreenColor,
                keyboardType: TextInputType.number,
                controller: idController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please Enter ID';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your ID',
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
                        color: isIDHovered ? kButtonHoverColor : kButtonColor),
                    gapPadding: 10,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isIDHovered ? kButtonHoverColor : kButtonColor),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isIDHovered ? kButtonHoverColor : kButtonColor),
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
                  prefixIcon: const Icon(
                    Icons.key,
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
                  setState(() {
                    isLoggedIn = true;
                  });
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRouter.navigationMainRoute,
                    ModalRoute.withName(AppRouter.navigationMainRoute),
                    arguments: 3,
                  );
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
            )
          ],
        ),
      ),
    );
  }
}

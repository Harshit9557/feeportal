import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ContactUsNormalLayout extends StatefulWidget {
  const ContactUsNormalLayout({Key? key}) : super(key: key);

  @override
  State<ContactUsNormalLayout> createState() => _ContactUsNormalLayoutState();
}

class _ContactUsNormalLayoutState extends State<ContactUsNormalLayout> {
  String completeNo = "";
  bool isEmailHovered = false;
  bool isPhoneHovered = false;
  bool isNameHovered = false;
  bool isMessageHovered = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final queryController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            //contact info container
            Container(
              width: device.width,
              padding: const EdgeInsets.only(
                  top: 15, bottom: 20, right: 20, left: 20),
              margin: const EdgeInsets.only(
                  top: 30, bottom: 10, right: 20, left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    offset: Offset.zero,
                    color: Colors.grey.shade300,
                    blurRadius: 7.0,
                    spreadRadius: 4.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      color: kSplashScreenColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textScaleFactor: 1.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Container(
                      height: 1,
                      width: 100,
                      color: kTextColor.withOpacity(0.2),
                    ),
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamco.',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      color: kSplashScreenColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textScaleFactor: 1.5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // email
                  Row(
                    children: const [
                      Icon(
                        Icons.email_outlined,
                        color: kButtonColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'info@payon.com',
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          color: kSplashScreenColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textScaleFactor: 1.5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //phone
                  Row(
                    children: const [
                      Icon(
                        Icons.phone,
                        color: kButtonColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '+91 9876543210',
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          color: kSplashScreenColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textScaleFactor: 1.5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //fax
                  Row(
                    children: const [
                      Icon(
                        Icons.fax,
                        color: kButtonColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '+91 (987) 654 321 0',
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          color: kSplashScreenColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textScaleFactor: 1.5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //ask label
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
              child: Text(
                'Fill out this form to ask any query',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  color: kButtonColor,
                  fontWeight: FontWeight.w600,
                ),
                textScaleFactor: 1.5,
              ),
            ),
            //form
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name label
                    const Text(
                      'Name*',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        color: kSplashScreenColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textScaleFactor: 1.5,
                    ),
                    //name field
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
                    //email label
                    const Text(
                      'Email*',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        color: kSplashScreenColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textScaleFactor: 1.5,
                    ),
                    //email field
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
                      child: TextFormField(
                        cursorColor: kSplashScreenColor,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
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
                                color: isEmailHovered
                                    ? kButtonHoverColor
                                    : kButtonColor),
                            gapPadding: 10,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: isEmailHovered
                                    ? kButtonHoverColor
                                    : kButtonColor),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: isEmailHovered
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
                    //phone label
                    const Text(
                      'Phone*',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        color: kSplashScreenColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textScaleFactor: 1.5,
                    ),
                    //phone field
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
                    //query label
                    const Text(
                      'Query*',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        color: kSplashScreenColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textScaleFactor: 1.5,
                    ),
                    //query field
                    MouseRegion(
                      onHover: (_) {
                        setState(() {
                          isMessageHovered = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          isMessageHovered = false;
                        });
                      },
                      child: TextFormField(
                        maxLines: 5,
                        cursorColor: kSplashScreenColor,
                        keyboardType: TextInputType.text,
                        controller: queryController,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return 'Please Enter Your Query';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your query',
                          hintStyle: TextStyle(
                            color: kTextColor.withOpacity(0.5),
                            fontSize: 13,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: isMessageHovered
                                    ? kButtonHoverColor
                                    : kButtonColor),
                            gapPadding: 10,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: isMessageHovered
                                    ? kButtonHoverColor
                                    : kButtonColor),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: isMessageHovered
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
                    Center(
                      child: SizedBox(
                        height: 60,
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRouter.navigationMainRoute,
                                ModalRoute.withName(
                                    AppRouter.navigationMainRoute),
                                arguments: 0,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kSplashScreenColor,
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                    const SizedBox(
                      height: 30,
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

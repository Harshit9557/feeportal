import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileNormalLayout extends StatefulWidget {
  const ProfileNormalLayout({Key? key}) : super(key: key);

  @override
  State<ProfileNormalLayout> createState() => _ProfileNormalLayoutState();
}

class _ProfileNormalLayoutState extends State<ProfileNormalLayout> {
  bool isEditTapped = false;
  bool isSaveTapped = false;
  final _newData = {"name": "", "email": "", "phone": ""};
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              if (!isEditTapped)
                GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: const Text(
                        'Proceed to Edit Profile?',
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
                          onPressed: () {
                            setState(() {
                              isEditTapped = true;
                            });
                            Navigator.of(context).pop();
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
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      height: 45,
                      width: device.width - 40,
                      color: kButtonColor,
                      child: const Center(
                        child: Text(
                          'EDIT',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (isEditTapped)
                GestureDetector(
                  onTap: () async {
                    if (isEditTapped && !isSaveTapped) {
                      await FirebaseAuth.instance.currentUser
                          ?.updateEmail(_newData['email'].toString());
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .set(_newData)
                          .whenComplete(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Profile Details Updated'),
                          ),
                        );
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRouter.navigationMainRoute,
                          ModalRoute.withName(AppRouter.navigationMainRoute),
                          arguments: 3,
                        );
                      });
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      height: 45,
                      width: device.width - 40,
                      color: kButtonColor,
                      child: Center(
                        child: isSaveTapped
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'SAVE',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              //change password container
              // GestureDetector(
              //   onTap: () => Navigator.of(context)
              //       .pushNamed(AppRouter.changePasswordRoute),
              //   child: Container(
              //     height: 43,
              //     width: device.width - 40,
              //     decoration: BoxDecoration(
              //       border: Border.all(color: kLoginContainerColor),
              //       color: Colors.white,
              //     ),
              //     child: const Center(
              //       child: Text(
              //         'CHANGE PASSWORD',
              //         style: TextStyle(
              //           fontFamily: 'Poppins',
              //           fontSize: 16,
              //           fontWeight: FontWeight.w500,
              //           color: kWishlistListColor,
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error Occured!!'),
              ),
            );
          }
          if (snapshot.hasData) {
            _newData['email'] = snapshot.data['email'];
            _newData['phone'] = snapshot.data['phone'];
            _newData['name'] = snapshot.data['name'];
            print(_newData);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 25, right: 25),
                child: Column(
                  children: [
                    //name field
                    TextFormField(
                      readOnly: !isEditTapped,
                      cursorColor: Colors.orange,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: kWishlistListColor,
                      ),
                      initialValue: snapshot.data['name'],
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      onChanged: (value) => _newData['name'] = value.trim(),
                      decoration: const InputDecoration(
                        label: Text(
                          'Name',
                        ),
                        labelStyle: TextStyle(
                          color: kSplashScreenColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: kButtonColor,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: kSplashScreenColor,
                          ),
                        ),
                      ),
                    ),
                    //mobile number field
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextFormField(
                        readOnly: !isEditTapped,
                        initialValue: snapshot.data['phone'],
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                        onChanged: (value) => _newData['phone'] = value.trim(),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: kWishlistListColor,
                        ),
                        decoration: const InputDecoration(
                          label: Text(
                            'Mobile Number',
                          ),
                          labelStyle: TextStyle(
                            color: kSplashScreenColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: kButtonColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: kSplashScreenColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //mail field
                    TextFormField(
                      readOnly: !isEditTapped,
                      cursorColor: Colors.orange,
                      initialValue: snapshot.data['email'],
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      onChanged: (value) => _newData['email'] = value.trim(),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: kWishlistListColor,
                      ),
                      decoration: const InputDecoration(
                        label: Text(
                          'Email',
                        ),
                        labelStyle: TextStyle(
                          color: kSplashScreenColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: kButtonColor,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: kSplashScreenColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

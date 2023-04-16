import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/routes/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class SendMoneyNormalLayout extends StatefulWidget {
  const SendMoneyNormalLayout({Key? key}) : super(key: key);

  @override
  State<SendMoneyNormalLayout> createState() => _SendMoneyNormalLayoutState();
}

class _SendMoneyNormalLayoutState extends State<SendMoneyNormalLayout> {
  final amountController = TextEditingController();
  String _paymode = '';
  String _payvalue = '';
  String _paymethod = '';
  bool _orderComplete = false;
  late Razorpay _razorpay;
  final _confettiContrl = ConfettiController();
  final List<Map<String, dynamic>> _payModes = [
    {'paymode': 'UPI', 'payvalue': 'RAZORPAY', 'method': 'upi'},
    {'paymode': 'Wallets', 'payvalue': 'RAZORPAY', 'method': 'wallet'},
    {
      'paymode': 'Credit / Debit / ATM card',
      'payvalue': 'RAZORPAY',
      'method': 'card'
    },
    {'paymode': 'Net Banking', 'payvalue': 'RAZORPAY', 'method': 'netbanking'},
  ];

  final _newData = {'name': "", 'phone': "", 'email': ""};

  _showMessage(String message) {
    Flushbar(
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.all(10),
      //backgroundColor: kMessageBarColor,
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

  Future _payRazor() async {
    if (_paymode.isEmpty || _payvalue.isEmpty) {
      return _showMessage('Please select payment mode!');
    }
    var options = {
      'key': 'rzp_test_p1Jjig3i2aYnDb',
      'amount': int.parse(amountController.text) * 100,
      'name': 'PayOn',
      "currency": "INR",
      'description': 'Payment for order',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': _newData['phone'],
        'email': _newData['email'],
        "method": _paymethod,
        'name': _newData['name']
      },
      //'notes': _address,
      'external': {
        'wallets': ['paytm']
      },
      "theme": {
        "color": "#09CFB4",
      },
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      _showMessage('Error Occured');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('transactions')
        .doc(response.orderId)
        .set({
      'payment_id': response.paymentId,
      'amount': amountController.text,
      'date': DateTime.now(),
      'payment_mode': _paymethod,
      'status': 'success'
    }).whenComplete(() {
      setState(() => _orderComplete = true);
      _showMessage('Payment Successful');
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    setState(() {
      _orderComplete = false;
    });
    _showMessage('Error Occured');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    setState(() {
      _orderComplete = false;
    });
    _showMessage('Error Occured');
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _confettiContrl.play();
  }

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send Money',
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
      bottomNavigationBar: !_orderComplete
          ? SizedBox(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => _payRazor(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      height: 45,
                      width: device.width - 40,
                      color: kButtonColor,
                      child: const Center(
                        child: Text(
                          'Proceed',
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
              ),
            )
          : null,
      body: _orderComplete
          ? Container(
              margin: const EdgeInsets.only(top: 5),
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConfettiWidget(
                      confettiController: _confettiContrl,
                      blastDirectionality: BlastDirectionality.explosive,
                      shouldLoop: false,
                    ),
                    const Text(
                      'THANK YOU',
                      style: TextStyle(
                        fontSize: 36,
                        //fontFamily: 'Trirong',
                        fontWeight: FontWeight.w600,
                        color: kWishlistListColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'for choosing',
                      style: TextStyle(
                        fontSize: 24,
                        //fontFamily: 'Trirong',
                        fontWeight: FontWeight.w300,
                        color: kWishlistListColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'PAYON',
                      style: TextStyle(
                        fontSize: 36,
                        //fontFamily: 'Trirong',
                        fontWeight: FontWeight.w600,
                        color: kWishlistListColor,
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _orderComplete = false;
                        });
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRouter.allTransactionsMainRoute,
                          ModalRoute.withName(AppRouter.navigationMainRoute),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        color: kLoginContainerColor,
                        child: const Text(
                          'YOUR TRANSACTIONS',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Trirong',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 25, right: 25),
                child: Column(
                  children: [
                    StreamBuilder(
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
                          return Container(
                            color: Colors.white,
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Column(
                              children: [
                                const Text(
                                  'Fill out details to proceed with the payment',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: kWishlistListColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                //name field
                                TextFormField(
                                  readOnly: true,
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: TextFormField(
                                    readOnly: true,
                                    initialValue: snapshot.data['phone'],
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a valid phone number';
                                      }
                                      return null;
                                    },
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
                                  readOnly: true,
                                  cursorColor: Colors.orange,
                                  initialValue: snapshot.data['email'],
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
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
                                //amount field
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: TextFormField(
                                    readOnly: false,
                                    keyboardType: TextInputType.number,
                                    controller: amountController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a valid amount';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: kWishlistListColor,
                                    ),
                                    decoration: const InputDecoration(
                                      label: Text(
                                        'Amount',
                                      ),
                                      hintText: 'Enter Amount',
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
                              ],
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Text(
                              'CHOOSE PAYMENT OPTION',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: kWishlistListColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: _payModes.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CheckboxListTile(
                                  tileColor: Colors.white,
                                  value:
                                      _paymode == _payModes[index]['paymode'],
                                  onChanged: (_) => setState(() {
                                    _paymode = _payModes[index]['paymode'];
                                    _payvalue = _payModes[index]['payvalue'];
                                    _paymethod = _payModes[index]['method'];
                                  }),
                                  title: Text(
                                    _payModes[index]['paymode'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                      color: kWishlistListColor,
                                    ),
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  checkboxShape: const StadiumBorder(),
                                  contentPadding:
                                      const EdgeInsets.only(left: 5),
                                  activeColor: kButtonHoverColor,
                                  checkColor: kButtonHoverColor,
                                );
                              },
                              separatorBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: kDrawerColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

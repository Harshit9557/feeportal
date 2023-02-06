import 'dart:io';

import 'package:flutter/material.dart';

class AllTransactionsMainScreen extends StatefulWidget {
  const AllTransactionsMainScreen({Key? key}) : super(key: key);

  @override
  State<AllTransactionsMainScreen> createState() =>
      _AllTransactionsMainScreenState();
}

class _AllTransactionsMainScreenState extends State<AllTransactionsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Transactions'),
        foregroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back_outlined,
          ),
        ),
        centerTitle: false,
      ),
    );
  }
}
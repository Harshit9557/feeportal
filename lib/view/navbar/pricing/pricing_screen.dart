import 'package:flutter/material.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({Key? key}) : super(key: key);

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Pricing',
        ),
        centerTitle: false,
        actions: const [
          Icon(Icons.menu),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}

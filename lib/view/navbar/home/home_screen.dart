import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
        ),
        centerTitle: false,
        actions: const [
          Icon(Icons.menu),
          SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

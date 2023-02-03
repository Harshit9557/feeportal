import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Future<bool> initCache({required BuildContext context}) async {
  //   var auth = Provider.of<AuthProvider>(context, listen: false);
  //   if (await auth.tryAutoLogin()) {
  //     setState(() {
  //       isLoggedIn = true;
  //     });
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  @override
  void initState() {
    super.initState();
    //initCache(context: context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    int? page = ModalRoute.of(context)!.settings.arguments as int?;
    setState(() => _selectedIndex = page ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<AuthProvider>(context);
    // final screens = [
    //   HomePage(
    //     token: user.token,
    //   ),
    //   const WishListScreen(),
    //   NotificationSceen(
    //     token: user.token,
    //   ),
    //   const CartMainScreen(),
    //   isLoggedIn ? const AccountScreen() : const LoginScreen(),
    // ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border_outlined),
            label: 'Services',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Pricing',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      //body: screens.elementAt(_selectedIndex),
      body: Text(_selectedIndex.toString()),
    );
  }
}

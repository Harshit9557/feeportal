import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String _token = '';
  bool get loggedIn => _token != null;
  savePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    var userData;
    // final userData = jsonEncode({
    //   'token': _token,
    //   'expiryDate': _expiryDate!.toIso8601String(),
    //   'id': _user!.id,
    //   'name': _user!.name,
    //   'email': _user!.email,
    //   'mobile_number': _user!.mobile_number,
    //   'addresses': _user!.addresses,
    //   'gender': _user!.gender,
    // });
    prefs.setString('userInfo', userData);
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userInfo')) {
      return false;
    }
    final storedUserData =
        jsonDecode(prefs.getString('userInfo')!) as Map<String, dynamic>;
    final tokenExpiryDate = DateTime.parse(storedUserData['expiryDate']);
    if (tokenExpiryDate.subtract(const Duration(days: 1)) == DateTime.now()) {
      return false;
    }
    // _user = UserModel(
    //   storedUserData['id'],
    //   storedUserData['name'],
    //   storedUserData['email'],
    //   storedUserData['mobile_number'],
    //   storedUserData['gender'],
    //   List<Map<String, dynamic>>.from(storedUserData['addresses']),
    // );

    notifyListeners();
    return true;
  }
}

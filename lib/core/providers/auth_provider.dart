import 'dart:convert';

import 'package:feeportal/app/constants/url_constants.dart';
import 'package:feeportal/core/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  set token(String? tkn) {
    _token = tkn;
    notifyListeners();
  }

  UserModel? _user;
  UserModel get user => _user!;
  bool get loggedIn => _token != null;
  savePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = jsonEncode({
      'token': _token,
      'id': _user!.id,
      'username': _user!.username,
      'email': _user!.email,
      'phone': _user!.phone,
    });
    prefs.setString('userInfo', userData);
  }

  Future<http.Response> signUp(String name, email, password, number) async {
    final response = await http.post(
      Uri.parse('${baseURL}users/register'),
      body: jsonEncode({
        "username": name,
        "email": email,
        "phone": number,
        "password": password,
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (!response.body.contains('error')) {
      final data = jsonDecode(response.body);
      _token = data['token'];
      _user = UserModel(
        data['data']['id'],
        data['data']['username'],
        data['data']['email'],
        data['data']['phone'],
      );
      notifyListeners();
      savePrefs();
    }
    return response;
  }

  Future<http.Response> login(String email, String password) async {
    final response = await http.post(
      Uri.http(baseURL, loginURL),
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
      headers: {
        //"Access-Control-Allow-Origin": "*",
        //'Access-Control-Allow-Methods': "GET, POST, OPTIONS",
        "Content-Type": "application/json",
        //"Accept": '*/*'
      },
    );
    if (!response.body.contains('error')) {
      final data = await jsonDecode(response.body);
      print(data);
      _token = data['data']['token'];
      _user = UserModel(
        data['data']['id'],
        data['data']['username'],
        data['data']['email'],
        data['data']['phone'],
      );
      notifyListeners();
      savePrefs();
    }
    return response;
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userInfo')) {
      return false;
    }
    final storedUserData =
        jsonDecode(prefs.getString('userInfo')!) as Map<String, dynamic>;
    _user = UserModel(
      storedUserData['id'],
      storedUserData['username'],
      storedUserData['email'],
      storedUserData['phone'],
    );
    _token = storedUserData['token'];
    notifyListeners();
    return true;
  }

  Future<void> logOut() async {
    final response = await http.patch(
      Uri.parse('${baseURL}api/auth/logout'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $_token',
      },
    );
    if (!response.body.contains('error')) {
      _user = null;
      _token = null;
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
    }
  }

  Future<bool> deleteAccount() async {
    final response = await http.patch(
      Uri.parse('${baseURL}api/deleteAccount'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $_token',
      },
    );
    if (!response.body.contains('error')) {
      _user = null;
      _token = null;
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      return true;
    }
    return false;
  }
}

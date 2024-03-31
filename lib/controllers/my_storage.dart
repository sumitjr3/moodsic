import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class MyStorage {
  static const String myStringKey = 'myStringKey';
  static const String myIntKey = '1';
  static const String usernameKey = 'user';
  static const String emailKey = 'email@gmail.com';

  //the
  static Future<void> saveString(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(myStringKey, value);
  }

  static Future<String?> getString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(myStringKey);
  }

  //avatar
  static Future<void> saveInt(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(myIntKey, value);
  }

  static Future<int?> getInt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(myIntKey);
  }

  //username
  static Future<void> saveStringUserName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(usernameKey, value);
  }

  static Future<String?> getStringUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(usernameKey);
  }

  //email
  static Future<void> saveStringMail(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(emailKey, value);
  }

  static Future<String?> getStringMail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailKey);
  }
}

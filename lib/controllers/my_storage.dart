import 'package:shared_preferences/shared_preferences.dart';

class MyStorage {
  static const String myStringKey = 'myStringKey';

  static Future<void> saveString(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(myStringKey, value);
  }

  static Future<String?> getString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(myStringKey);
  }
}

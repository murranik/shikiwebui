import 'dart:convert';

import 'package:discordbotadminui/Models/Administrator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static late SharedPreferences _sharedPrefs;

  static Future init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences getPrefs() => _sharedPrefs;

  static setTheme(String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("theme", value);
  }

  static getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("theme") ?? "white";
  }

  static Future saveUser(Administrator administrator) async {
    await _sharedPrefs.setString(
        "user", json.encoder.convert(administrator.toMap()));
  }

  static String? loadUser() {
    var data = _sharedPrefs.getString("user");
    return data;
  }

  static Future removeUser() async {
    await _sharedPrefs.setString("user", "");
  }
}

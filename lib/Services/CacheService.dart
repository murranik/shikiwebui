import 'dart:convert';

import 'package:discordbotadminui/Models/Administrator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheServices {
  static late SharedPreferences _sharedPrefs;

  static Future init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences getPrefs() => _sharedPrefs;

  static Future saveUser(Administrator administrator) async {
    await _sharedPrefs.setString(
        "user", json.encoder.convert(administrator.toMap()));
  }

  static String? loadUser() {
    var data = _sharedPrefs.getString("user");
    return data;
  }

  Future removeUser() async {
    await _sharedPrefs.setString("user", "");
  }
}

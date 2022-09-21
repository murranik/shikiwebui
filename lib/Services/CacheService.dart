import 'dart:convert';

import 'package:discordbotadminui/Models/Administrator.dart';
import 'package:discordbotadminui/Models/CustomThemeData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static late SharedPreferences _sharedPrefs;

  static Future init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences getPrefs() => _sharedPrefs;

  static Future setTheme(CustomThemeData theme) async {
    await _sharedPrefs.setString("theme", json.encoder.convert(theme.toMap()));
    var m = _sharedPrefs.getString("theme")!;
  }

  static String? getTheme() {
    return _sharedPrefs.getString("theme")!;
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

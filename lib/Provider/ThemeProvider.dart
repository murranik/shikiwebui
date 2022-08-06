import 'package:discordbotadminui/Services/CacheService.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late bool _isDark;
  bool get isDark => _isDark;

  ThemeProvider() {
    _isDark = false;
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    CacheService.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await CacheService.getTheme();
    notifyListeners();
  }
}

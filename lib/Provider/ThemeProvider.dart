import 'dart:convert';

import 'package:discordbotadminui/Helpers/ThemeManager.dart';
import 'package:discordbotadminui/Models/CustomThemeData.dart';
import 'package:discordbotadminui/Services/CacheService.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    getThemeFromCache();
  }

  List<String> _themes = [];

  List<String> get themes => _themes;

  set themes(List<String> themes) {
    _themes = themes;
    notifyListeners();
  }

  late CustomThemeData _currentTheme;

  CustomThemeData get currentTheme => _currentTheme;

  set currentTheme(CustomThemeData currentTheme) {
    _currentTheme = currentTheme;
    CacheService.setTheme(_currentTheme).then((value) => notifyListeners());
  }

  getThemeFromCache() {
    var data = CacheService.getTheme();
    if (data != null) {
      _currentTheme = CustomThemeData.fromMap(json.decoder.convert(data));
    } else {
      _currentTheme = ThemeManager.getBasicTheme();
    }
    notifyListeners();
  }
}

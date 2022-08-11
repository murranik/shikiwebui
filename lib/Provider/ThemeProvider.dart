import 'dart:convert';

import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Models/ColorHelperData.dart';
import 'package:discordbotadminui/Services/CacheService.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    _currentTheme = ColorHelper.getBasicColorHelper();
    getPreferences();
  }

  List<String> _themes = [];

  List<String> get themes => _themes;

  set themes(List<String> themes) {
    _themes = themes;
    notifyListeners();
  }

  late ColorHelperData _currentTheme;

  ColorHelperData get currentTheme => _currentTheme;

  set currentTheme(ColorHelperData currentTheme) {
    _currentTheme = currentTheme;
    CacheService.setTheme(_currentTheme).then((value) => notifyListeners());
  }

  getPreferences() {
    var data = CacheService.getTheme();
    if (data != null) {
      _currentTheme = ColorHelperData.fromMap(json.decoder.convert(data));
    }
    notifyListeners();
  }
}

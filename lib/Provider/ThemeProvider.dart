import 'package:discordbotadminui/Services/CacheService.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late String _theme;
  String get theme => _theme;

  final List<String> _themes = [
    "white",
    "dark",
    "highcontrast",
    "dynamic",
    "add",
    "all"
  ];

  List<String> get themes => _themes;

  ThemeProvider() {
    _theme = "white";
    getPreferences();
  }

  set theme(String value) {
    _theme = value;
    CacheService.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _theme = await CacheService.getTheme();
    notifyListeners();
  }
}

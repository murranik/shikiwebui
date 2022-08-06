import 'package:discordbotadminui/Provider/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _DataTableCellColors {
  var defaultBoxShadowColor = const Color.fromARGB(255, 218, 217, 217);
  var defaultBorderColor = const Color.fromARGB(255, 200, 200, 200);
  var defaultInputTextColor = Colors.black;
  var defaultEditColor = const Color.fromARGB(141, 9, 231, 9);
  _DataTableCellColors(bool isDark) {
    if (isDark) {
      defaultBoxShadowColor = Color.fromARGB(255, 63, 63, 63);
      defaultBorderColor = const Color.fromARGB(255, 30, 30, 30);
      defaultInputTextColor = Colors.black;
      defaultEditColor = const Color.fromARGB(141, 9, 231, 9);
    } else {
      defaultBoxShadowColor = const Color.fromARGB(255, 218, 217, 217);
      defaultBorderColor = const Color.fromARGB(255, 200, 200, 200);
      defaultInputTextColor = Colors.black;
      defaultEditColor = const Color.fromARGB(141, 9, 231, 9);
    }
  }
}

class _DropdownButtonColors {
  var defaultBarrierColor = const Color.fromARGB(130, 232, 226, 220);
  var defaultIconEnableColor = Colors.black;
  var defaultIconDisabledColor = Colors.grey;
  _DropdownButtonColors(bool isDark) {
    if (isDark) {
      defaultBarrierColor = const Color.fromARGB(130, 232, 226, 220);
      defaultIconEnableColor = Colors.black;
      defaultIconDisabledColor = Colors.grey;
    } else {
      defaultBarrierColor = const Color.fromARGB(130, 232, 226, 220);
      defaultIconEnableColor = Colors.black;
      defaultIconDisabledColor = Colors.grey;
    }
  }
}

class _ServerStatusColors {
  var defaultShadowColor = Colors.grey.withOpacity(0.5);
  var defaultBackgroundColor = Colors.white60;
  var onlineColor = Colors.green;
  var offlineColor = const Color.fromARGB(255, 203, 42, 30);
  _ServerStatusColors(bool isDark) {
    if (isDark) {
      defaultShadowColor = Colors.grey.withOpacity(0.5);
      defaultBackgroundColor = Colors.white60;
      onlineColor = Colors.green;
      offlineColor = const Color.fromARGB(255, 203, 42, 30);
    } else {
      defaultShadowColor = Colors.grey.withOpacity(0.5);
      defaultBackgroundColor = Colors.white60;
      onlineColor = Colors.green;
      offlineColor = const Color.fromARGB(255, 203, 42, 30);
    }
  }
}

class ColorHelper {
  static _ColorHelperData getColorHelper(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    if (themeProvider.isDark) {
      return _ColorHelperData(
        activeColor: Colors.green,
        cancelColor: const Color.fromARGB(255, 203, 42, 30),
        dataTableCellColors: _DataTableCellColors(themeProvider.isDark),
        defaultNavMenuBackgroundColor: const Color(0xff333333),
        defaultNavMenuTextColor: Colors.white,
        defaultTextColor: Colors.white,
        dropdownButtonColors: _DropdownButtonColors(themeProvider.isDark),
        serverStatusColors: _ServerStatusColors(themeProvider.isDark),
      );
    } else {
      return _ColorHelperData(
        activeColor: Colors.green,
        cancelColor: const Color.fromARGB(255, 203, 42, 30),
        dataTableCellColors: _DataTableCellColors(themeProvider.isDark),
        defaultNavMenuBackgroundColor: const Color(0xff333333),
        defaultNavMenuTextColor: Colors.white,
        defaultTextColor: Colors.black,
        dropdownButtonColors: _DropdownButtonColors(themeProvider.isDark),
        serverStatusColors: _ServerStatusColors(themeProvider.isDark),
      );
    }
  }
}

class _ColorHelperData {
  late _DataTableCellColors dataTableCellColors;
  late _DropdownButtonColors dropdownButtonColors;
  late _ServerStatusColors serverStatusColors;
  late Color defaultTextColor;
  late Color defaultNavMenuTextColor;
  late Color defaultNavMenuBackgroundColor;
  late Color activeColor;
  late Color cancelColor;

  _ColorHelperData({
    required this.dataTableCellColors,
    required this.dropdownButtonColors,
    required this.serverStatusColors,
    required this.defaultTextColor,
    required this.defaultNavMenuTextColor,
    required this.defaultNavMenuBackgroundColor,
    required this.activeColor,
    required this.cancelColor,
  });
}

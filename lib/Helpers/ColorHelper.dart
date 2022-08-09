import 'dart:math';

import 'package:discordbotadminui/Provider/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _DataTableCellColors {
  var defaultBoxShadowColor = const Color.fromARGB(255, 218, 217, 217);
  var defaultBorderColor = const Color.fromARGB(255, 200, 200, 200);
  var defaultInputTextColor = Colors.black;
  var defaultEditColor = const Color.fromARGB(141, 9, 231, 9);
  _DataTableCellColors({String theme = "light"}) {
    if (theme == "dark") {
      defaultBoxShadowColor = Color.fromARGB(255, 63, 63, 63);
      defaultBorderColor = const Color.fromARGB(255, 30, 30, 30);
      defaultInputTextColor = Colors.black;
      defaultEditColor = const Color.fromARGB(141, 9, 231, 9);
    } else if (theme == "dynamic") {
      defaultBoxShadowColor =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
      defaultBorderColor =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
      defaultInputTextColor =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
      defaultEditColor =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
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
  _DropdownButtonColors({String theme = "light"}) {
    if (theme == "dark") {
      defaultBarrierColor = const Color.fromARGB(130, 232, 226, 220);
      defaultIconEnableColor = Colors.black;
      defaultIconDisabledColor = Colors.grey;
    } else if (theme == "dynamic") {
      defaultBarrierColor =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
      defaultIconEnableColor =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
      defaultIconDisabledColor =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
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
  _ServerStatusColors({String theme = "light"}) {
    if (theme == "dark") {
      defaultShadowColor = Colors.grey.withOpacity(0.5);
      defaultBackgroundColor = Colors.black;
      onlineColor = Colors.green;
      offlineColor = const Color.fromARGB(255, 203, 42, 30);
    } else if (theme == "dynamic") {
      defaultShadowColor = Colors
          .primaries[Random().nextInt(Colors.primaries.length)]
          .withOpacity(0.5);
      defaultBackgroundColor =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
      onlineColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      offlineColor =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
    } else {
      defaultShadowColor = Colors.grey.withOpacity(0.5);
      defaultBackgroundColor = Colors.white60;
      onlineColor = Colors.green;
      offlineColor = const Color.fromARGB(255, 203, 42, 30);
    }
  }
}

class ColorHelper {
  static _ColorHelperData getColorHelper(BuildContext context,
      {String? theme}) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    var currentTheme = theme ?? themeProvider.theme;
    if (currentTheme == "dark") {
      return _ColorHelperData(
        activeColor: Colors.green,
        cancelColor: const Color.fromARGB(255, 203, 42, 30),
        defaultAppBackGroundColor: const Color(0xff00010D),
        dataTableCellColors: _DataTableCellColors(theme: currentTheme),
        defaultNavMenuBackgroundColor: const Color(0xff333333),
        defaultNavMenuTextColor: Colors.black,
        defaultTextColor: Colors.white,
        dropdownButtonColors: _DropdownButtonColors(theme: currentTheme),
        serverStatusColors: _ServerStatusColors(theme: currentTheme),
      );
    } else if (currentTheme == "white") {
      return _ColorHelperData(
        activeColor: Colors.green,
        cancelColor: const Color.fromARGB(255, 203, 42, 30),
        defaultAppBackGroundColor: Colors.white,
        dataTableCellColors: _DataTableCellColors(theme: currentTheme),
        defaultNavMenuBackgroundColor: const Color(0xff333333),
        defaultNavMenuTextColor: Colors.white,
        defaultTextColor: Colors.black,
        dropdownButtonColors: _DropdownButtonColors(theme: currentTheme),
        serverStatusColors: _ServerStatusColors(theme: currentTheme),
      );
    } else if (currentTheme == "dynamic") {
      return _ColorHelperData(
        activeColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        cancelColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        defaultAppBackGroundColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        dataTableCellColors: _DataTableCellColors(theme: currentTheme),
        defaultNavMenuBackgroundColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        defaultNavMenuTextColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        defaultTextColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        dropdownButtonColors: _DropdownButtonColors(theme: currentTheme),
        serverStatusColors: _ServerStatusColors(theme: currentTheme),
      );
    } else {
      return _ColorHelperData(
        activeColor: Colors.green,
        cancelColor: const Color.fromARGB(255, 203, 42, 30),
        defaultAppBackGroundColor: Colors.white,
        dataTableCellColors: _DataTableCellColors(theme: currentTheme),
        defaultNavMenuBackgroundColor: const Color(0xff333333),
        defaultNavMenuTextColor: Colors.white,
        defaultTextColor: Colors.black,
        dropdownButtonColors: _DropdownButtonColors(theme: currentTheme),
        serverStatusColors: _ServerStatusColors(theme: currentTheme),
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
  late Color defaultAppBackGroundColor;
  late Color activeColor;
  late Color editColor = Colors.orange;
  late Color cancelColor;

  _ColorHelperData({
    required this.dataTableCellColors,
    required this.dropdownButtonColors,
    required this.serverStatusColors,
    required this.defaultTextColor,
    required this.defaultNavMenuTextColor,
    required this.defaultNavMenuBackgroundColor,
    required this.defaultAppBackGroundColor,
    required this.activeColor,
    required this.cancelColor,
  });
}

import 'dart:convert';

import 'package:discordbotadminui/Models/ColorHelperData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ThemesApiService {
  static Future<List<ColorHelperData>> getThemes(BuildContext context) async {
    var request = await get(Uri.parse('https://localhost:7632/api/Themes'));

    if (request.statusCode == 200) {
      final data = jsonDecode(request.body) as List;
      var themes = data.map((e) => ColorHelperData.fromMap(e)).toList();
      themes.add(ColorHelperData(
          name: 'add',
          dataTableCellColors: DataTableCellColors(),
          dropdownButtonColors: DropdownButtonColors(),
          floatingBoxColors: FloatingBoxColors()));
      return themes;
    }

    return [];
  }

  static Future<ColorHelperData?> getTheme(String name) async {
    var request =
        await get(Uri.parse('https://localhost:7632/api/Themes/$name'));

    if (request.statusCode == 200) {
      return ColorHelperData.fromMap(jsonDecode(request.body));
    }

    return null;
  }

  static Future<String?> getServerStatus() async {
    var request =
        await get(Uri.parse('https://localhost:7632/api/Themes?count=0'));

    if (request.statusCode == 200) {
      return "Server online";
    }

    return null;
  }

  static Future<bool> saveTheme(ColorHelperData newTheme) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var data = '''{
  "name": "${newTheme.name}",
  "description": "${newTheme.description}",
  "dataTableCellColors": {
    "id": ${newTheme.dataTableCellColors.id},
    "parentName": "${newTheme.dataTableCellColors.parentName}",
    "defaultBoxShadowColor": "0x${newTheme.dataTableCellColors.defaultBoxShadowColor.value.toRadixString(16)}",
    "defaultBorderColor": "0x${newTheme.dataTableCellColors.defaultBorderColor.value.toRadixString(16)}",
    "defaultInputTextColor": "0x${newTheme.dataTableCellColors.defaultInputTextColor.value.toRadixString(16)}"
  },
  "dropdownButtonColors": {
    "id": ${newTheme.dropdownButtonColors.id},
    "parentName": "${newTheme.dropdownButtonColors.parentName}",
    "defaultBarrierColor": "0x${newTheme.dropdownButtonColors.defaultBarrierColor.value.toRadixString(16)}",
    "defaultIconEnableColor": "0x${newTheme.dropdownButtonColors.defaultIconEnableColor.value.toRadixString(16)}",
    "defaultIconDisabledColor": "0x${newTheme.dropdownButtonColors.defaultIconDisabledColor.value.toRadixString(16)}"
  },
  "floatingBoxColors": {
    "id": ${newTheme.floatingBoxColors.id},
    "parentName": "${newTheme.floatingBoxColors.parentName}",
    "defaultShadowColor": "0x${newTheme.floatingBoxColors.defaultShadowColor.value.toRadixString(16)}",
    "defaultBackgroundColor": "0x${newTheme.floatingBoxColors.defaultBackgroundColor.value.toRadixString(16)}"
  },
  "defaultNavMenuBackgroundColor": "0x${newTheme.defaultNavMenuBackgroundColor.value.toRadixString(16)}",
  "defaultAppBackGroundColor": "0x${newTheme.defaultAppBackGroundColor.value.toRadixString(16)}",
  "activeColor": "0x${newTheme.activeColor.value.toRadixString(16)}",
  "editColor": "0x${newTheme.editColor.value.toRadixString(16)}",
  "cancelColor": "0x${newTheme.cancelColor.value.toRadixString(16)}",
  "defaultNavMenuTextColor": "0x${newTheme.defaultNavMenuTextColor.value.toRadixString(16)}",
  "defaultTextColor": "0x${newTheme.defaultTextColor.value.toRadixString(16)}"
}''';

    var url = Uri.parse('https://localhost:7632/api/Themes/Add');
    var res = await post(url, headers: headers, body: data);
    if (res.statusCode != 200) {
      return true;
    }

    return false;
  }
}

import 'dart:convert';

import 'package:discordbotadminui/Models/ColorHelperData.dart';
import 'package:discordbotadminui/Provider/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class ThemesApiService {
  static Future<List<ColorHelperData>> getThemes(BuildContext context) async {
    var request = await get(Uri.parse('https://localhost:7163/api/Themes'));

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
        await get(Uri.parse('https://localhost:7163/api/Themes/$name'));

    if (request.statusCode == 200) {
      return ColorHelperData.fromMap(jsonDecode(request.body));
    }

    return null;
  }
}

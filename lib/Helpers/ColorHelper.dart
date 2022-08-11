import 'package:discordbotadminui/Models/ColorHelperData.dart';
import 'package:discordbotadminui/Provider/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorHelper {
  static ColorHelperData getColorHelper(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return themeProvider.currentTheme;
  }

  static ColorHelperData getBasicColorHelper() {
    return ColorHelperData(
      description: 'basic',
      editColor: Colors.orange,
      name: 'basic',
      activeColor: Colors.green,
      cancelColor: const Color.fromARGB(255, 203, 42, 30),
      defaultAppBackGroundColor: Colors.white,
      defaultNavMenuBackgroundColor: const Color(0xff333333),
      defaultNavMenuTextColor: Colors.white,
      defaultTextColor: Colors.black,
      dataTableCellColors: DataTableCellColors(
        id: -1,
        parentName: 'basic',
        defaultBoxShadowColor: const Color.fromARGB(255, 218, 217, 217),
        defaultBorderColor: const Color.fromARGB(255, 200, 200, 200),
        defaultInputTextColor: Colors.black,
        defaultEditColor: const Color.fromARGB(141, 9, 231, 9),
      ),
      dropdownButtonColors: DropdownButtonColors(
        id: -1,
        parentName: 'basic',
        defaultBarrierColor: const Color.fromARGB(130, 232, 226, 220),
        defaultIconEnableColor: Colors.black,
        defaultIconDisabledColor: Colors.grey,
      ),
      floatingBoxColors: FloatingBoxColors(
        id: -1,
        parentName: 'basic',
        defaultShadowColor: Colors.grey.withOpacity(0.5),
        defaultBackgroundColor: Colors.white60,
      ),
    );
  }
}

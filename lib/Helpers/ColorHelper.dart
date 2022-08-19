import 'package:discordbotadminui/Models/ColorHelperData.dart';
import 'package:discordbotadminui/Provider/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorHelper {
  static ColorHelperData getColorHelper(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

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

  static ColorHelperData getThemeCopy(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    final tempTheme = themeProvider.currentTheme;
    return ColorHelperData(
      name: tempTheme.name,
      dataTableCellColors: DataTableCellColors(
        defaultBorderColor: tempTheme.dataTableCellColors.defaultBorderColor,
        defaultBoxShadowColor:
            tempTheme.dataTableCellColors.defaultBoxShadowColor,
        defaultInputTextColor:
            tempTheme.dataTableCellColors.defaultInputTextColor,
        id: tempTheme.dataTableCellColors.id,
        parentName: tempTheme.dataTableCellColors.parentName,
      ),
      dropdownButtonColors: DropdownButtonColors(
        defaultBarrierColor: tempTheme.dropdownButtonColors.defaultBarrierColor,
        defaultIconDisabledColor:
            tempTheme.dropdownButtonColors.defaultIconDisabledColor,
        defaultIconEnableColor:
            tempTheme.dropdownButtonColors.defaultIconEnableColor,
        id: tempTheme.dropdownButtonColors.id,
        parentName: tempTheme.dropdownButtonColors.parentName,
      ),
      floatingBoxColors: FloatingBoxColors(
        defaultBackgroundColor:
            tempTheme.floatingBoxColors.defaultBackgroundColor,
        defaultShadowColor: tempTheme.floatingBoxColors.defaultShadowColor,
        id: tempTheme.floatingBoxColors.id,
        parentName: tempTheme.floatingBoxColors.parentName,
      ),
      activeColor: tempTheme.activeColor,
      cancelColor: tempTheme.cancelColor,
      defaultAppBackGroundColor: tempTheme.defaultAppBackGroundColor,
      defaultNavMenuBackgroundColor: tempTheme.defaultNavMenuBackgroundColor,
      defaultNavMenuTextColor: tempTheme.defaultNavMenuTextColor,
      defaultTextColor: tempTheme.defaultTextColor,
      description: tempTheme.description,
      editColor: tempTheme.editColor,
    );
  }

  static Color getColorByName(String choosedColor, BuildContext context,
      {ColorHelperData? theme}) {
    ColorHelperData? currentTheme;
    if (theme != null) {
      currentTheme = theme;
    } else {
      currentTheme =
          Provider.of<ThemeProvider>(context, listen: false).currentTheme;
    }
    var color = Colors.transparent;
    switch (choosedColor) {
      case "Active color":
        color = currentTheme.activeColor;
        break;
      case "Cancel/error color":
        color = currentTheme.cancelColor;
        break;
      case "Edit color":
        color = currentTheme.editColor;
        break;
      case "Text color":
        color = currentTheme.defaultTextColor;
        break;
      case "Nav menu text color":
        color = currentTheme.defaultNavMenuTextColor;
        break;
      case "Nav menu background color":
        color = currentTheme.defaultNavMenuBackgroundColor;
        break;
      case "Background color":
        color = currentTheme.defaultAppBackGroundColor;
        break;
      case "Shadow color":
        color = currentTheme.floatingBoxColors.defaultShadowColor;
        break;
      case "Floating background color":
        color = currentTheme.floatingBoxColors.defaultBackgroundColor;
        break;
      case "Barrier color":
        color = currentTheme.dropdownButtonColors.defaultBarrierColor;
        break;
      case "IconEnable color":
        color = currentTheme.dropdownButtonColors.defaultIconEnableColor;
        break;
      case "IconDisabled color":
        color = currentTheme.dropdownButtonColors.defaultIconDisabledColor;
        break;
      case "Box shadow color":
        color = currentTheme.dataTableCellColors.defaultBoxShadowColor;
        break;
      case "Border color":
        color = currentTheme.dataTableCellColors.defaultBorderColor;
        break;
      case "Input text color":
        color = currentTheme.dataTableCellColors.defaultInputTextColor;
        break;
      default:
        color = Colors.transparent;
    }

    return color;
  }
}

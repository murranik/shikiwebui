import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Models/ColorHelperData.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TextStyleHelper {
  static TextStyleHelperData get(BuildContext context,
      {ColorHelperData? theme}) {
    if (theme != null) {
      return TextStyleHelperData(
          defaultTextStyle:
              TextStyle(fontSize: 6.sp, color: theme.defaultTextColor),
          defaultDataTableInputTextStyle: TextStyle(
              fontSize: 4.sp,
              color: theme.dataTableCellColors.defaultInputTextColor),
          defaultNavMenuTextStyle:
              TextStyle(fontSize: 4.sp, color: theme.defaultNavMenuTextColor),
          defaultServerStatusTextStyle:
              TextStyle(fontSize: 4.sp, color: theme.activeColor),
          defaultTextInputStyle: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 4.sp, color: theme.defaultTextColor),
          ),
          createThemeComponentStyles: CreateThemeComponentStyles(
              defaultExpandableListCategoryTextStyle:
                  TextStyle(fontSize: 4.sp, color: theme.defaultTextColor),
              defaultExpandableListItemTextStyle:
                  TextStyle(fontSize: 4.sp, color: theme.defaultTextColor)));
    }
    return TextStyleHelperData(
        defaultTextStyle: TextStyle(
            fontSize: 6.sp,
            color: ColorHelper.getColorHelper(context).defaultTextColor),
        defaultDataTableInputTextStyle: TextStyle(
            fontSize: 6.sp,
            color: ColorHelper.getColorHelper(context)
                .dataTableCellColors
                .defaultInputTextColor),
        defaultNavMenuTextStyle: TextStyle(
            fontSize: 4.sp,
            color: ColorHelper.getColorHelper(context).defaultNavMenuTextColor),
        defaultServerStatusTextStyle: TextStyle(
            fontSize: 4.sp,
            color: ColorHelper.getColorHelper(context).activeColor),
        defaultTextInputStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 4.sp,
              color: ColorHelper.getColorHelper(context).defaultTextColor),
        ),
        createThemeComponentStyles: CreateThemeComponentStyles(
            defaultExpandableListCategoryTextStyle: TextStyle(
                fontSize: 4.sp,
                color: ColorHelper.getColorHelper(context).defaultTextColor),
            defaultExpandableListItemTextStyle: TextStyle(
                fontSize: 4.sp,
                color: ColorHelper.getColorHelper(context).defaultTextColor)));
  }
}

class CreateThemeComponentStyles {
  late TextStyle defaultExpandableListItemTextStyle;
  late TextStyle defaultExpandableListCategoryTextStyle;

  CreateThemeComponentStyles(
      {required this.defaultExpandableListCategoryTextStyle,
      required this.defaultExpandableListItemTextStyle});
}

class TextStyleHelperData {
  late TextStyle defaultTextStyle;
  late TextStyle defaultDataTableInputTextStyle;
  late TextStyle defaultTextInputStyle;
  late TextStyle defaultNavMenuTextStyle;
  late TextStyle defaultServerStatusTextStyle;
  late CreateThemeComponentStyles createThemeComponentStyles;
  TextStyleHelperData({
    required this.defaultTextStyle,
    required this.defaultTextInputStyle,
    required this.defaultNavMenuTextStyle,
    required this.defaultServerStatusTextStyle,
    required this.defaultDataTableInputTextStyle,
    required this.createThemeComponentStyles,
  });
}

import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Provider/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TextStyleHelper {
  static TextStyleHelperData getTextStyleHelper(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    if (themeProvider.theme == "white") {
      return TextStyleHelperData(
        defaultTextStyle: TextStyle(
            fontSize: 6.sp,
            color: ColorHelper.getColorHelper(context).defaultTextColor),
        defaultNavMenuTextStyle: TextStyle(
            fontSize: 4.sp,
            color: ColorHelper.getColorHelper(context).defaultNavMenuTextColor),
        defaultServerStatusTextStyle: TextStyle(
            fontSize: 9.sp,
            color: ColorHelper.getColorHelper(context)
                .serverStatusColors
                .onlineColor),
        defaultTextInputStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 4.sp,
              color: ColorHelper.getColorHelper(context).defaultTextColor),
        ),
      );
    } else {
      return TextStyleHelperData(
        defaultTextStyle: TextStyle(
            fontSize: 6.sp,
            color: ColorHelper.getColorHelper(context).defaultTextColor),
        defaultNavMenuTextStyle: TextStyle(
            fontSize: 4.sp,
            color: ColorHelper.getColorHelper(context).defaultNavMenuTextColor),
        defaultServerStatusTextStyle: TextStyle(
            fontSize: 9.sp,
            color: ColorHelper.getColorHelper(context)
                .serverStatusColors
                .onlineColor),
        defaultTextInputStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 4.sp,
              color: ColorHelper.getColorHelper(context).defaultTextColor),
        ),
      );
    }
  }
}

class TextStyleHelperData {
  late TextStyle defaultTextStyle;
  late TextStyle defaultTextInputStyle;
  late TextStyle defaultNavMenuTextStyle;
  late TextStyle defaultServerStatusTextStyle;
  TextStyleHelperData({
    required this.defaultTextStyle,
    required this.defaultTextInputStyle,
    required this.defaultNavMenuTextStyle,
    required this.defaultServerStatusTextStyle,
  });
}

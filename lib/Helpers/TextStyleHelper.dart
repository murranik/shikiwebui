import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TextStyleHelper {
  static final defaultTextStyle =
      TextStyle(fontSize: 6.sp, color: ColorHelper.defaultTextColor);
  static final defaultTextInputStyle = GoogleFonts.lato(
    textStyle: TextStyle(fontSize: 4.sp, color: ColorHelper.defaultTextColor),
  );
  static final defaultNavMenuTextStyle =
      TextStyle(fontSize: 4.sp, color: ColorHelper.defaultNavMenuTextColor);
  static final defaultServerStatusTextStyle = TextStyle(
      fontSize: 9.sp, color: ColorHelper.serverStatusColors.onlineColor);
}

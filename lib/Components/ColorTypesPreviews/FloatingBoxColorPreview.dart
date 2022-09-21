import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/CustomThemeData.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FloatingBoxColorPreview extends StatelessWidget {
  final Color pickerColor;
  final bool changeBackGround;
  final CustomThemeData theme;

  const FloatingBoxColorPreview(
      {Key? key,
      required this.pickerColor,
      required this.changeBackGround,
      required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.defaultAppBackGroundColor,
      alignment: Alignment.center,
      child: Container(
        height: 40.h,
        width: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: changeBackGround
                  ? theme.floatingBoxColors.defaultShadowColor
                  : pickerColor,
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: changeBackGround
              ? pickerColor
              : theme.floatingBoxColors.defaultBackgroundColor,
        ),
        child: Container(
            alignment: Alignment.center,
            child: Text(
              "Content",
              style:
                  TextStyleHelper.get(context, theme: theme).defaultTextStyle,
            )),
      ),
    );
  }
}

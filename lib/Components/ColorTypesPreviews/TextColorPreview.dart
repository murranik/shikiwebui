import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/ColorHelperData.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextColorPreview extends StatelessWidget {
  final Color pickerColor;
  final ColorHelperData theme;
  const TextColorPreview(
      {Key? key, required this.pickerColor, required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.colorBurn,
          color: theme.defaultAppBackGroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextPreview(fontSize: 4.sp, pickerColor: pickerColor, theme: theme),
          TextPreview(fontSize: 6.sp, pickerColor: pickerColor, theme: theme),
          TextPreview(fontSize: 7.sp, pickerColor: pickerColor, theme: theme),
          TextPreview(fontSize: 8.sp, pickerColor: pickerColor, theme: theme),
        ],
      ),
    );
  }
}

class TextPreview extends StatelessWidget {
  final Color pickerColor;
  final double fontSize;
  final ColorHelperData theme;
  const TextPreview(
      {Key? key,
      required this.pickerColor,
      required this.fontSize,
      required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Text example Text example Text example Text example',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyleHelper.get(context, theme: theme)
                .defaultTextStyle
                .withColor(pickerColor)
                .withFontSize(fontSize),
          ),
        ),
      ],
    );
  }
}

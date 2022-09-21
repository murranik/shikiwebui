import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/CustomThemeData.dart';
import 'package:flutter/material.dart';

class CancelColorPreview extends StatelessWidget {
  final Color pickerColor;
  final CustomThemeData theme;
  const CancelColorPreview(
      {Key? key, required this.pickerColor, required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: theme.defaultAppBackGroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.cancel,
                  color: pickerColor,
                ),
                Icon(
                  Icons.close,
                  color: pickerColor,
                ),
                Text(
                  "Theme server",
                  style: TextStyleHelper.get(context, theme: theme)
                      .defaultTextStyle
                      .withColor(pickerColor),
                ),
              ],
            ),
          ],
        ));
  }
}

import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Managers/ThemeManager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuditButton extends StatelessWidget {
  final String buttonTitle;
  final bool isPressed;
  const AuditButton(
      {Key? key, required this.buttonTitle, required this.isPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            color: ThemeManager.getTheme(context).activeColor, width: 0.5.sp),
      ),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                ThemeManager.getTheme(context)
                    .activeColor
                    .withOpacity(isPressed ? 0.3 : 0.0)),
            padding: MaterialStateProperty.all(EdgeInsets.zero)),
        onPressed: () {},
        child: Text(
          buttonTitle,
          style:
              TextStyleHelper.get(context).defaultTextStyle.withFontSize(5.sp),
        ),
      ),
    ));
  }
}

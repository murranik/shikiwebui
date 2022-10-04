import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Managers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/CustomThemeData.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NavMenuButton extends StatelessWidget {
  final String text;
  final Color? choosedColor;
  final Function onClick;
  final bool locked;
  final Color? activeColor;
  final Color? defaultNavMenuTextStyle;
  final CustomThemeData? theme;
  const NavMenuButton(
      {Key? key,
      required this.text,
      required this.onClick,
      this.choosedColor,
      this.locked = false,
      this.activeColor,
      this.defaultNavMenuTextStyle,
      this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: locked ? "To obtain this page please login" : '',
      child: Container(
          height: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 0.2.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: choosedColor ?? const Color(0xff333333),
          ),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: activeColor ?? choosedColor ?? const Color(0xff333333),
              ),
              padding: EdgeInsets.only(left: 0.5.w, right: 0.5.w, top: 0.5.h),
              child: Row(children: [
                if (locked)
                  Icon(
                    Icons.lock,
                    size: 4.sp,
                    color: defaultNavMenuTextStyle ??
                        theme!.defaultNavMenuTextColor,
                  ),
                InkWell(
                  onTap: () => onClick(),
                  child: Text(
                    text,
                    style: defaultNavMenuTextStyle == null
                        ? TextStyleHelper.get(context, theme: theme)
                            .defaultNavMenuTextStyle
                        : TextStyleHelper.get(context, theme: theme)
                            .defaultNavMenuTextStyle
                            .withColor(defaultNavMenuTextStyle!),
                  ),
                ),
              ]))),
    );
  }
}

import 'package:discordbotadminui/Components/NavMenuButton.dart';
import 'package:discordbotadminui/Models/CustomThemeData.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NavMenuBackgroundColorPreview extends StatelessWidget {
  final Color pickerColor;
  final CustomThemeData theme;
  const NavMenuBackgroundColorPreview(
      {Key? key, required this.pickerColor, required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: pickerColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                VerticalDivider(
                  color: theme.defaultNavMenuTextColor.withAlpha(55),
                  width: 0.2.w,
                ),
                NavMenuButton(
                  text: "Home",
                  onClick: () {},
                  activeColor: pickerColor,
                  choosedColor: theme.activeColor,
                  theme: theme,
                ),
                VerticalDivider(
                  color: theme.defaultNavMenuTextColor.withAlpha(55),
                  width: 0.2.w,
                ),
                NavMenuButton(
                  text: "Users",
                  onClick: () {},
                  activeColor: pickerColor,
                  theme: theme,
                ),
                VerticalDivider(
                  color: theme.defaultNavMenuTextColor.withAlpha(55),
                  width: 0.2.w,
                ),
                NavMenuButton(
                  text: "Roles",
                  activeColor: pickerColor,
                  theme: theme,
                  onClick: () {},
                  locked: false,
                ),
                VerticalDivider(
                  color: theme.defaultNavMenuTextColor.withAlpha(55),
                  width: 0.2.w,
                ),
                NavMenuButton(
                  text: "Settings",
                  onClick: () {},
                  activeColor: pickerColor,
                  theme: theme,
                ),
                VerticalDivider(
                  color: theme.defaultNavMenuTextColor.withAlpha(55),
                  width: 0.2.w,
                ),
              ],
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(25),
            color: theme.activeColor,
            child: IconButton(
                onPressed: () {},
                iconSize: 6.sp,
                icon: Icon(
                  Icons.person,
                  color: theme.defaultNavMenuTextColor,
                )),
          ),
        ],
      ),
    );
  }
}

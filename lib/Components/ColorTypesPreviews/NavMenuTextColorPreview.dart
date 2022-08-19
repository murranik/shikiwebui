import 'package:discordbotadminui/Components/NavMenuButton.dart';
import 'package:discordbotadminui/Models/ColorHelperData.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NavMenuTextColorPreview extends StatelessWidget {
  final Color pickerColor;
  final ColorHelperData theme;
  const NavMenuTextColorPreview(
      {Key? key, required this.pickerColor, required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.defaultAppBackGroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 20.w,
            height: 8.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavMenuButton(
                  onClick: () {},
                  text: "Home",
                  locked: true,
                  defaultNavMenuTextStyle: pickerColor,
                  theme: theme,
                ),
                NavMenuButton(
                  onClick: () {},
                  text: "Roles",
                  locked: true,
                  defaultNavMenuTextStyle: pickerColor,
                  theme: theme,
                ),
                NavMenuButton(
                  onClick: () {},
                  text: "Users",
                  locked: true,
                  defaultNavMenuTextStyle: pickerColor,
                  theme: theme,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

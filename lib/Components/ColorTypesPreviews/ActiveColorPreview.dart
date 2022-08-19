import 'package:discordbotadminui/Components/NavMenuButton.dart';
import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/ColorHelperData.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ActiveColorPreview extends StatelessWidget {
  final Color pickerColor;
  final ColorHelperData theme;
  const ActiveColorPreview(
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
              children: [
                NavMenuButton(
                  onClick: () {},
                  text: "Home",
                  locked: true,
                  activeColor: pickerColor,
                  theme: theme,
                ),
                NavMenuButton(
                  onClick: () {},
                  text: "Roles",
                  locked: true,
                  activeColor: pickerColor,
                  theme: theme,
                ),
                NavMenuButton(
                  onClick: () {},
                  text: "Users",
                  activeColor: pickerColor,
                  theme: theme,
                  locked: true,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Material(
                borderRadius: BorderRadius.circular(25),
                color: pickerColor,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      color: theme.defaultNavMenuTextColor,
                    )),
              ),
              Icon(
                Icons.arrow_drop_up,
                color: pickerColor,
              ),
              Icon(
                Icons.check,
                color: pickerColor,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: pickerColor,
              ),
              CircularProgressIndicator(
                color: pickerColor,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Theme server",
                style: TextStyleHelper.get(context, theme: theme)
                    .defaultTextStyle
                    .withColor(pickerColor),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Text(
                      "Menu item title",
                      style: TextStyleHelper.get(context, theme: theme)
                          .defaultTextStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 1.w),
                    child: Icon(Icons.arrow_forward_ios, color: pickerColor),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

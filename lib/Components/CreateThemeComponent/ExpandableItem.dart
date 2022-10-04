import 'package:discordbotadminui/Managers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExpandableItem extends StatelessWidget {
  final String text;
  final Function callback;
  const ExpandableItem({Key? key, required this.text, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback(text);
      },
      child: Container(
          margin: EdgeInsets.only(left: 1.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: TextStyleHelper.get(context)
                      .createThemeComponentStyles
                      .defaultExpandableListItemTextStyle),
              Icon(
                Icons.arrow_forward_ios,
                color: ThemeManager.getTheme(context).activeColor,
                size: 4.sp,
              )
            ],
          )),
    );
  }
}

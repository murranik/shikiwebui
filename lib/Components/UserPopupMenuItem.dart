import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserPopupMenuItem extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const UserPopupMenuItem({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InkWell(
              borderRadius: BorderRadius.circular(25.0),
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Text(
                      text,
                      style: TextStyleHelper.get(context).defaultTextStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 1.w),
                    child: Icon(Icons.arrow_forward_ios,
                        color: ColorHelper.getColorHelper(context).activeColor),
                  )
                ],
              )),
        ));
  }
}

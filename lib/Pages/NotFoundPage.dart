import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          "404\nPage not found",
          style:
              TextStyleHelper.get(context).defaultTextStyle.withFontSize(10.sp),
          textAlign: TextAlign.center,
        )),
        TextButton(
            onPressed: () {},
            child: Text(
              "home",
              style: TextStyleHelper.get(context).defaultTextStyle,
            ))
      ],
    ));
  }
}

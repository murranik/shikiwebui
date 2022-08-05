import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          style: TextStyleHelper.defaultTextStyle.withFontSize(10.sp),
          textAlign: TextAlign.center,
        )),
        TextButton(
            onPressed: () => (GoRouter.of(context).go("/")),
            child: Text("home"))
      ],
    ));
  }
}

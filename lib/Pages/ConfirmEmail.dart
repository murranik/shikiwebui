import 'package:discordbotadminui/Components/Timer.dart';
import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Managers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class ConfirmEmailPage extends StatelessWidget {
  static const String route = "/confirmemail";
  const ConfirmEmailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Email succsessfully confirmed",
            style: TextStyleHelper.get(context)
                .defaultTextStyle
                .withFontSize(10.sp),
            textAlign: TextAlign.center,
          ),
        ),
        RefreshTimer(
          onEnd: () {
            GoRouter.of(context).go("/");
          },
          seconds: 5,
          textColor: ThemeManager.getTheme(context).defaultTextColor,
          timePrefix: "Redirect after ",
        ),
      ],
    ));
  }
}

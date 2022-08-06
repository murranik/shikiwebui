import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Provider/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeNotifier, child) {
      return Column(
        children: [
          Text("Ui settings",
              style:
                  TextStyleHelper.getTextStyleHelper(context).defaultTextStyle),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: ColorHelper.getColorHelper(context)
                            .serverStatusColors
                            .defaultShadowColor,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: ColorHelper.getColorHelper(context)
                        .serverStatusColors
                        .defaultBackgroundColor,
                  ),
                  width: 40.w,
                  height: 60.h,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dark theme",
                            style: TextStyleHelper.getTextStyleHelper(context)
                                .defaultTextStyle,
                          ),
                          Switch(
                              value: themeNotifier.isDark,
                              onChanged: (value) async {
                                if (themeNotifier.isDark) {
                                  themeNotifier.isDark = false;
                                } else {
                                  themeNotifier.isDark = true;
                                }
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      );
    });
  }
}

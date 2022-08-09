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
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Themes",
                            style: TextStyleHelper.getTextStyleHelper(context)
                                .defaultTextStyle,
                          ),
                        ),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          itemCount: themeNotifier.themes.length,
                          padding: EdgeInsets.all(2.sp),
                          itemBuilder: (context, index) {
                            if (themeNotifier.themes[index] == "add") {
                              return Container(
                                decoration: BoxDecoration(
                                    color: ColorHelper.getColorHelper(context)
                                        .serverStatusColors
                                        .defaultBackgroundColor,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Icon(
                                  Icons.add,
                                  size: 10.sp,
                                ),
                              );
                            } else if (themeNotifier.themes[index] == "all") {
                              return Container();
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  themeNotifier.theme =
                                      themeNotifier.themes[index];
                                },
                                child: themeNotifier.themes[index] == "dynamic"
                                    ? Container(
                                        decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          stops: [.5, .5],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            ColorHelper.getColorHelper(context,
                                                    theme: themeNotifier
                                                        .themes[index])
                                                .defaultAppBackGroundColor,
                                            ColorHelper.getColorHelper(context,
                                                    theme: themeNotifier
                                                        .themes[index])
                                                .cancelColor,
                                            ColorHelper.getColorHelper(context,
                                                    theme: themeNotifier
                                                        .themes[index])
                                                .activeColor,
                                            ColorHelper.getColorHelper(context,
                                                    theme: themeNotifier
                                                        .themes[index])
                                                .defaultNavMenuTextColor,
                                            ColorHelper.getColorHelper(context,
                                                    theme: themeNotifier
                                                        .themes[index])
                                                .editColor,
                                            ColorHelper.getColorHelper(context,
                                                    theme: themeNotifier
                                                        .themes[index])
                                                .serverStatusColors
                                                .offlineColor,
                                          ],
                                        ),
                                      ))
                                    : Container(
                                        decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          stops: [.5, .5],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            ColorHelper.getColorHelper(context,
                                                    theme: themeNotifier
                                                        .themes[index])
                                                .defaultAppBackGroundColor,
                                            ColorHelper.getColorHelper(context,
                                                    theme: themeNotifier
                                                        .themes[index])
                                                .activeColor, // top Right part
                                          ],
                                        ),
                                      )),
                              );
                            }
                          },
                        ),
                        Center(
                          child: Text(
                            "Languages",
                            style: TextStyleHelper.getTextStyleHelper(context)
                                .defaultTextStyle,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ))
        ],
      );
    });
  }
}

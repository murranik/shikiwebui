import 'dart:async';

import 'package:discordbotadminui/Components/Timer.dart';
import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Services/DiscordBotApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ServerStatusComponent extends StatefulWidget {
  final String? serverLink;
  const ServerStatusComponent({Key? key, this.serverLink}) : super(key: key);

  @override
  State<ServerStatusComponent> createState() => _ServerStatusComponentState();
}

class _ServerStatusComponentState extends State<ServerStatusComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        FutureBuilder(
          future: DiscordBotApiService.getServerStatus(),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                {
                  return StatefulBuilder(
                      builder: (BuildContext context, update) {
                    if (snapshot.data != null) {
                      return Container(
                          width: 60.w,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(3.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: ColorHelper.getColorHelper(context)
                                    .serverStatusColors
                                    .defaultShadowColor,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: ColorHelper.getColorHelper(context)
                                .serverStatusColors
                                .defaultBackgroundColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: ColorHelper.getColorHelper(context)
                                    .serverStatusColors
                                    .onlineColor,
                                size: 9.sp,
                              ),
                              Text(
                                snapshot.data!,
                                style:
                                    TextStyleHelper.getTextStyleHelper(context)
                                        .defaultServerStatusTextStyle,
                              ),
                              RefreshTimer(
                                onEnd: () {
                                  setState(() {});
                                },
                                seconds: 20,
                                timePrefix: "Remaining to check connection:",
                                textColor: ColorHelper.getColorHelper(context)
                                    .serverStatusColors
                                    .onlineColor,
                              )
                            ],
                          ));
                    } else {
                      return Container(
                          width: 60.w,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 3.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: ColorHelper.getColorHelper(context)
                                    .serverStatusColors
                                    .defaultShadowColor,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: ColorHelper.getColorHelper(context)
                                .serverStatusColors
                                .defaultBackgroundColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                CupertinoIcons.clear_thick_circled,
                                color: ColorHelper.getColorHelper(context)
                                    .serverStatusColors
                                    .offlineColor,
                                size: 14.sp,
                              ),
                              Text(
                                "Server offline",
                                style:
                                    TextStyleHelper.getTextStyleHelper(context)
                                        .defaultServerStatusTextStyle
                                        .withColor(
                                            ColorHelper.getColorHelper(context)
                                                .serverStatusColors
                                                .offlineColor),
                              ),
                              RefreshTimer(
                                onEnd: () {
                                  setState(() {});
                                },
                                seconds: 20,
                                timePrefix: "Remaining to reconnect:",
                                textColor: ColorHelper.getColorHelper(context)
                                    .serverStatusColors
                                    .offlineColor,
                              )
                            ],
                          ));
                    }
                  });
                }
              case ConnectionState.waiting:
                {
                  return Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 20.sp,
                            height: 20.sp,
                            child: CircularProgressIndicator(
                              color: ColorHelper.getColorHelper(context)
                                  .activeColor,
                            ),
                          )));
                }
              default:
                {
                  return Expanded(
                      child: Center(
                    child: Text("No data",
                        style: TextStyleHelper.getTextStyleHelper(context)
                            .defaultTextStyle),
                  ));
                }
            }
          },
        )
      ],
    );
  }
}

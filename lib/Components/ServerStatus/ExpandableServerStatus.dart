import 'package:discordbotadminui/Components/ServerStatus/ExpandableServerStatusItem.dart';
import 'package:discordbotadminui/Managers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Provider/ThemeProvider.dart';
import 'package:discordbotadminui/Services/DiscordBotApiService.dart';
import 'package:discordbotadminui/Services/ThemesApiService.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ExpandableServerStatus extends StatefulWidget {
  final Color debugColor;
  const ExpandableServerStatus({Key? key, required this.debugColor})
      : super(key: key);

  @override
  State<ExpandableServerStatus> createState() => _ExpandableServerStatusState();
}

class _ExpandableServerStatusState extends State<ExpandableServerStatus> {
  final expandController = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer(
        builder:
            (BuildContext context, ThemeProvider themeNotifier, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 0.5.w, right: 0.5.w),
                color: kDebugMode ? widget.debugColor : Colors.transparent,
                child: ExpandableNotifier(
                  controller: expandController,
                  child: Expandable(
                    collapsed: Container(),
                    expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          ExpandableServerStatusItem(
                              futureFunction: ThemesApiService.getServerStatus,
                              serverName: "Theme server"),
                          ExpandableServerStatusItem(
                              futureFunction:
                                  DiscordBotApiService.getServerStatus,
                              serverName: "Discord bot server"),
                        ]),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  expandController.toggle();
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.only(left: 0.5.w),
                  color: themeNotifier
                      .currentTheme.floatingBoxColors.defaultShadowColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Servers status",
                          style: TextStyleHelper.get(context)
                              .createThemeComponentStyles
                              .defaultExpandableListCategoryTextStyle,
                          overflow: TextOverflow.ellipsis),
                      !expandController.value
                          ? Icon(
                              Icons.arrow_drop_up,
                              color: themeNotifier.currentTheme.activeColor,
                            )
                          : Icon(
                              Icons.arrow_drop_down,
                              color: themeNotifier.currentTheme.activeColor,
                            )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

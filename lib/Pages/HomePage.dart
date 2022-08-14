import 'package:discordbotadminui/Components/ServerStatus/ExpandableServerStatus.dart';
import 'package:discordbotadminui/Components/UserPopupMenuItem.dart';
import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Managers/OverlaysManager.dart';
import 'package:discordbotadminui/Pages/NotFoundPage.dart';
import 'package:discordbotadminui/Pages/RolesPage.dart';
import 'package:discordbotadminui/Pages/SettingsPage.dart';
import 'package:discordbotadminui/Pages/UsersPage.dart';
import 'package:discordbotadminui/Provider/ThemeProvider.dart';
import 'package:discordbotadminui/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:discordbotadminui/Components/NavMenuButton.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  final int page;
  const HomePage({Key? key, required this.page}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var navButtonsList = [];
  var stickyKey = GlobalKey();
  var appKey = GlobalKey();
  var serverStatusOverlayIdentifier = "server status";
  var overlayIdentifier = "userPopup";
  void buildOverlay(BuildContext context) {
    OverlaysManager.buildOverlay(context, stickyKey,
        identifier: overlayIdentifier,
        useKey: true,
        right: 0.9.w,
        widht: 15.w,
        children: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UserPopupMenuItem(
              onTap: () {},
              text: "Edit",
            ),
            UserPopupMenuItem(
              onTap: () async {
                await UserService.logout();
                for (var everlay in OverlaysManager.overlays) {
                  everlay.overlayEntry!.remove();
                }
                OverlaysManager.overlays.clear();
                GoRouter.of(context).go("/");
              },
              text: "Logout",
            )
          ],
        ));
  }

  void buildServerStatusOverlay(BuildContext context) {
    OverlaysManager.buildOverlay(context, appKey,
        identifier: serverStatusOverlayIdentifier,
        useKey: false,
        right: 0.5.w,
        bottom: 0,
        widht: 15.w,
        children: ExpandableServerStatus(debugColor: Colors.transparent));
  }

  @override
  void initState() {
    buildOverlay(context);
    buildServerStatusOverlay(context);
    OverlaysManager.showOverlay(serverStatusOverlayIdentifier, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    navButtonsList = <Color?>[null, null, null, null];
    navButtonsList[widget.page - 1] =
        ColorHelper.getColorHelper(context).activeColor;
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeNotifier, child) {
      return Material(
        key: appKey,
        color: ColorHelper.getColorHelper(context).defaultAppBackGroundColor,
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Container(
              color: ColorHelper.getColorHelper(context)
                  .defaultNavMenuBackgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 3.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        NavMenuButton(
                          text: "Home",
                          onClick: () {
                            if (UserService.getUser().logedIn) {
                              GoRouter.of(context).go("/home?page=1");
                            }
                          },
                          choosedColor: navButtonsList[0],
                          locked: !UserService.getUser().logedIn,
                        ),
                        NavMenuButton(
                          text: "Users",
                          onClick: () {
                            if (UserService.getUser().logedIn) {
                              GoRouter.of(context).go("/home?page=2");
                            }
                          },
                          choosedColor: navButtonsList[1],
                          locked: !UserService.getUser().logedIn,
                        ),
                        NavMenuButton(
                          text: "Roles",
                          onClick: () {
                            if (UserService.getUser().logedIn) {
                              GoRouter.of(context).go("/home?page=3");
                            }
                          },
                          choosedColor: navButtonsList[2],
                          locked: !UserService.getUser().logedIn,
                        ),
                        NavMenuButton(
                          text: "Settings",
                          onClick: () {
                            if (UserService.getUser().logedIn) {
                              GoRouter.of(context).go("/home?page=4");
                            }
                          },
                          choosedColor: navButtonsList[3],
                          locked: !UserService.getUser().logedIn,
                        ),
                      ],
                    ),
                  ),
                  Listener(
                      onPointerDown: (event) {
                        if (UserService.getUser().logedIn) {
                          OverlaysManager.showOverlay(
                              overlayIdentifier, context);
                        }
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorHelper.getColorHelper(context).activeColor,
                        child: IconButton(
                            key: stickyKey,
                            onPressed: () {
                              if (!UserService.getUser().logedIn) {
                                GoRouter.of(context).go("/");
                              } else {}
                            },
                            iconSize: 6.sp,
                            icon: Icon(
                              Icons.person,
                              color: ColorHelper.getColorHelper(context)
                                  .defaultNavMenuTextColor,
                            )),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 14,
            child: Container(
                color: Colors.transparent,
                child: Builder(
                  builder: (BuildContext context) {
                    if (navButtonsList[1] != null) {
                      return const UsersPage();
                    } else if (navButtonsList[2] != null) {
                      return const RolesPage();
                    } else if (navButtonsList[0] != null) {
                      return Container();
                      /*return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(height: 2.h),
                            const ServerStatusComponent(
                                futureFunction:
                                    DiscordBotApiService.getServerStatus),
                            SizedBox(height: 2.h),
                            const ServerStatusComponent(
                                futureFunction:
                                    ThemesApiService.getServerStatus),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      );*/
                    } else if (navButtonsList[3] != null) {
                      return const SettingsPage();
                    } else {
                      return const NotFoundPage();
                    }
                  },
                )),
          ),
        ]),
      );
    });
  }

  @override
  void dispose() {
    //_overlayEntry!.remove();
    super.dispose();
  }
}

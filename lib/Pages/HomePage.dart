import 'package:discordbotadminui/Components/ServerStatus.dart';
import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Pages/NotFoundPage.dart';
import 'package:discordbotadminui/Pages/RolesPage.dart';
import 'package:discordbotadminui/Pages/UsersPage.dart';
import 'package:discordbotadminui/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:discordbotadminui/Components/NavMenuButton.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var navButtonsList = [ColorHelper.activeColor, null, null];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            color: ColorHelper.defaultNavMenuBackgroundColor,
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
                            navButtonsList[0] = ColorHelper.activeColor;
                            navButtonsList[1] = null;
                            navButtonsList[2] = null;
                            setState(() {});
                          }
                        },
                        choosedColor: navButtonsList[0],
                        locked: !UserService.getUser().logedIn,
                      ),
                      NavMenuButton(
                        text: "Users",
                        onClick: () {
                          if (UserService.getUser().logedIn) {
                            navButtonsList[0] = null;
                            navButtonsList[1] = ColorHelper.activeColor;
                            navButtonsList[2] = null;
                            setState(() {});
                          }
                        },
                        choosedColor: navButtonsList[1],
                        locked: !UserService.getUser().logedIn,
                      ),
                      NavMenuButton(
                        text: "Roles",
                        onClick: () {
                          if (UserService.getUser().logedIn) {
                            navButtonsList[0] = null;
                            navButtonsList[1] = null;
                            navButtonsList[2] = ColorHelper.activeColor;
                            setState(() {});
                          }
                        },
                        choosedColor: navButtonsList[2],
                        locked: !UserService.getUser().logedIn,
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (!UserService.getUser().logedIn) {
                        GoRouter.of(context).go("/");
                      }
                    },
                    iconSize: 6.sp,
                    icon: const Icon(
                      Icons.person,
                      color: ColorHelper.defaultNavMenuTextColor,
                    ))
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
                    return const ServerStatusComponent();
                  } else {
                    return const NotFoundPage();
                  }
                },
              )),
        ),
      ]),
    );
  }
}

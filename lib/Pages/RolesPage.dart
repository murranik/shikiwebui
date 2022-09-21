import 'package:discordbotadminui/Components/DataTableCells/DataTableCell.dart';
import 'package:discordbotadminui/Helpers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/DiscordRole.dart';
import 'package:discordbotadminui/Services/DiscordBotApiService.dart';
import 'package:discordbotadminui/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RolesPage extends StatefulWidget {
  static const String route = '/roles';
  const RolesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    if (UserService.getUser().logedIn) {
      return Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DataTableCell(name: "DiscordId"),
                DataTableCell(name: "Name"),
              ],
            ),
            FutureBuilder(
              future: DiscordBotApiService.fetchData<DiscordRole>(
                  "https://localhost:5001/api/Get/DiscordRole"),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      return Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              children: [
                                for (var discordRole in snapshot.data!)
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      DataTableCell(
                                        name: discordRole.discordId.toString(),
                                      ),
                                      DataTableCell(
                                          name: discordRole.name.toString()),
                                    ],
                                  )
                              ],
                            )
                          ],
                        ),
                      ));
                    } else {
                      return Expanded(
                          child: Center(
                        child: Text(
                          "No connection",
                          style: TextStyleHelper.get(context).defaultTextStyle,
                        ),
                      ));
                    }
                  case ConnectionState.waiting:
                    return Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 20.sp,
                              height: 20.sp,
                              child: CircularProgressIndicator(
                                color:
                                    ThemeManager.getTheme(context).activeColor,
                              ),
                            )));
                  default:
                    return Expanded(
                        child: Text("No data default",
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: ThemeManager.getTheme(context)
                                    .defaultTextColor)));
                }
              },
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Text(
          'Please login first before using this page',
          style: TextStyle(
              color: ThemeManager.getTheme(context).cancelColor,
              fontSize: 14.sp),
        ),
      );
    }
  }
}

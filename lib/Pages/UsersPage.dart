import 'package:discordbotadminui/Components/DataTableCell/DataTableCell.dart';
import 'package:discordbotadminui/Components/DataTableCell/DataTableTextFieldCell.dart';
import 'package:discordbotadminui/Components/DataTableCell/DataTableToolsCell.dart';
import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/DiscordUser.dart';
import 'package:discordbotadminui/Services/DiscordBotApiService.dart';
import 'package:discordbotadminui/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UsersPage extends StatefulWidget {
  static const String route = '/users';
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    if (UserService.getUser().logedIn) {
      return Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DataTableCell(name: "Id", flex: 6),
                DataTableCell(name: "DiscordId", flex: 22),
                DataTableCell(name: "GuildId", flex: 22),
                DataTableCell(
                  name: "Name",
                  flex: 20,
                ),
                DataTableCell(
                  name: "PrestigeLevel",
                  flex: 20,
                ),
              ],
            ),
            FutureBuilder(
              future: DiscordBotApiService.fetchData<DiscordUser>(
                  "https://localhost:5001/api/Get/DiscordUser"),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                var edit = false;
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
                                for (var discordUser
                                    in snapshot.data! as List<DiscordUser>)
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      DataTableCell(
                                          name: discordUser.id.toString(),
                                          flex: 6),
                                      DataTableCell(
                                          name: discordUser.discordId,
                                          flex: 22),
                                      DataTableCell(
                                          name: discordUser.guildId, flex: 22),
                                      DataTableCell(
                                        name: discordUser.name,
                                        flex: 20,
                                      ),
                                      StatefulBuilder(
                                        builder: (BuildContext context,
                                            void Function(void Function())
                                                update) {
                                          //Todo make widget with multiple editable textfield
                                          var oldLevel =
                                              discordUser.prestigeLevel;
                                          var editController =
                                              TextEditingController(
                                                  text: discordUser
                                                      .prestigeLevel
                                                      .toString());
                                          return Expanded(
                                              flex: 20,
                                              child: Row(
                                                children: [
                                                  DataTableTextFieldCell(
                                                    editController:
                                                        editController,
                                                    name: discordUser
                                                        .prestigeLevel
                                                        .toString(),
                                                    flex: 20,
                                                    save: () {
                                                      if (oldLevel.toString() !=
                                                          editController.text) {
                                                        DiscordBotApiService
                                                            .changeUserPrestigeLevel(
                                                                discordUser
                                                                    .discordId,
                                                                int.parse(
                                                                    editController
                                                                        .text));
                                                      }
                                                    },
                                                  )
                                                ],
                                              ));
                                        },
                                      )
                                    ],
                                  ),
                              ],
                            )
                          ],
                        ),
                      ));
                    } else {
                      return Expanded(
                          child: Center(
                        child: Text("No data",
                            style:
                                TextStyleHelper.get(context).defaultTextStyle),
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
                                color: ColorHelper.getColorHelper(context)
                                    .activeColor,
                              ),
                            )));
                  default:
                    return Expanded(
                        child: Center(
                      child: Text("No data default",
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: ColorHelper.getColorHelper(context)
                                  .defaultTextColor)),
                    ));
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
              color: ColorHelper.getColorHelper(context).cancelColor,
              fontSize: 14.sp),
        ),
      );
    }
  }
}

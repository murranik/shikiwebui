import 'package:discordbotadminui/Components/AuditPageComponents/AuditButton.dart';
import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Managers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/Audit/CommandCallInfo.dart';
import 'package:discordbotadminui/Services/DiscordBotApiService.dart';
import 'package:discordbotadminui/Services/UserService.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuditPage extends StatefulWidget {
  const AuditPage({Key? key}) : super(key: key);

  @override
  State<AuditPage> createState() => _AuditPageState();
}

class _AuditPageState extends State<AuditPage> {
  bool minimizeCommandView = false;
  List<CommandCallInfo> data = [];
  CommandCallInfo pickedData = CommandCallInfo(
    id: "empty",
    commandName: '',
    date: DateTime.now(),
    guildName: '',
    userId: 913201,
    commandParams: [],
    commandResult: '',
  );
  var load = true;

  @override
  void initState() {
    DiscordBotApiService.fetchData<CommandCallInfo>(
            "https://localhost:5001/api/Audit/Commands/${UserService.getUser().guildId}")
        .then((value) {
      data = value;
      load = false;
      data.sort(((prev, next) => prev.date.compareTo(next.date)));
      data = data.reversed.toList();
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        switch (load) {
          case true:
            return Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 20.sp,
                  height: 20.sp,
                  child: CircularProgressIndicator(
                    color: ThemeManager.getTheme(context).activeColor,
                  ),
                ));
          case false:
            var commands = data;

            return Container(
              margin: EdgeInsets.only(left: 0.5.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Row(
                            //buttons
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              AuditButton(
                                buttonTitle: 'Commands',
                                isPressed: true,
                              ),
                            ],
                          ),
                          Expanded(
                              //Todo data list
                              child: Scrollbar(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  for (var command in commands)
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Material(
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            splashColor:
                                                ThemeManager.getTheme(context)
                                                    .activeColor,
                                            onTap: () {
                                              pickedData = command;
                                              setState(() {});
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 0.5.w,
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 0.3.h,
                                                  horizontal: 0.15.w),
                                              decoration: BoxDecoration(
                                                  color: command.errorMessage ==
                                                          null
                                                      ? Colors.white
                                                      : ThemeManager.getTheme(
                                                              context)
                                                          .defaultAppBackGroundColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: ThemeManager
                                                                .getTheme(
                                                                    context)
                                                            .floatingBoxColors
                                                            .defaultShadowColor,
                                                        blurRadius: 5)
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.transparent,
                                                      width: 0.5.sp,
                                                      style:
                                                          BorderStyle.solid)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          command.commandName,
                                                          style: TextStyleHelper
                                                                  .get(context)
                                                              .defaultTextStyle
                                                              .withFontSize(
                                                                  5.sp),
                                                        ),
                                                        Text(
                                                          ' ${command.date.toString().replaceFirst(":00.000", "")}',
                                                          style: TextStyleHelper
                                                                  .get(context)
                                                              .defaultTextStyle
                                                              .withFontSize(
                                                                  5.sp),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder:
                                                        (BuildContext context) {
                                                      late IconData icon;
                                                      if (pickedData.id ==
                                                          command.id) {
                                                        icon = Icons
                                                            .keyboard_double_arrow_right_outlined;
                                                      } else {
                                                        if (command
                                                                .errorMessage ==
                                                            null) {
                                                          icon = Icons
                                                              .check_circle_outline;
                                                        } else {
                                                          icon = Icons
                                                              .error_outline;
                                                        }
                                                      }

                                                      return Icon(
                                                        icon,
                                                        color: command
                                                                    .errorMessage ==
                                                                null
                                                            ? ThemeManager
                                                                    .getTheme(
                                                                        context)
                                                                .activeColor
                                                            : ThemeManager
                                                                    .getTheme(
                                                                        context)
                                                                .cancelColor,
                                                        size: 5.sp,
                                                      );
                                                    },
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ))
                        ],
                      )),
                  Expanded(
                      flex: 12,
                      child: Container(
                        margin: EdgeInsets.all(1.sp),
                        padding: EdgeInsets.all(1.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: ThemeManager.getTheme(context)
                                  .floatingBoxColors
                                  .defaultShadowColor,
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          color: ThemeManager.getTheme(context)
                              .defaultAppBackGroundColor,
                        ),
                        //Todo refactor
                        child: Column(
                          children: [
                            if (pickedData.id != 'empty')
                              if (true)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'The result of calling - ',
                                      style: TextStyleHelper.get(context)
                                          .defaultTextStyle
                                          .withFontSize(5.sp),
                                    ),
                                    Text(
                                      pickedData.commandName.toUpperCase(),
                                      style: TextStyleHelper.get(context)
                                          .defaultTextStyle
                                          .withFontSize(5.sp)
                                          .withColor(
                                              ThemeManager.getTheme(context)
                                                  .activeColor),
                                    ),
                                    Text(
                                      ' command',
                                      style: TextStyleHelper.get(context)
                                          .defaultTextStyle
                                          .withFontSize(5.sp),
                                    ),
                                  ],
                                ),
                            if (pickedData.id != 'empty')
                              if (true)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Owner and date",
                                      style: TextStyleHelper.get(context)
                                          .defaultTextStyle
                                          .withFontSize(5.sp),
                                    )
                                  ],
                                ),
                            if (pickedData.id != 'empty')
                              if (true)
                                const Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                  height: 10,
                                ),
                            if (pickedData.id != 'empty')
                              if (true)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 9.w,
                                          height: 9.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                        ThemeManager.getTheme(
                                                                context)
                                                            .floatingBoxColors
                                                            .defaultShadowColor)
                                              ]),
                                          child: Icon(
                                            Icons.person_outline_rounded,
                                            size: 25.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0.1.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'murranik',
                                              style:
                                                  TextStyleHelper.get(context)
                                                      .defaultTextStyle
                                                      .withFontSize(5.sp),
                                            ),
                                            Text(
                                              pickedData.userId.toString(),
                                              style:
                                                  TextStyleHelper.get(context)
                                                      .defaultTextStyle
                                                      .withFontSize(5.sp),
                                            ),
                                            Text(
                                              'Забив',
                                              style:
                                                  TextStyleHelper.get(context)
                                                      .defaultTextStyle
                                                      .withFontSize(5.sp),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          DateFormat("dd MMMM yyyy")
                                              .format(pickedData.date),
                                          style: TextStyleHelper.get(context)
                                              .defaultTextStyle
                                              .withFontSize(5.sp),
                                        ),
                                        Text(
                                          "at - ${DateFormat("hh:mm").format(pickedData.date)}",
                                          style: TextStyleHelper.get(context)
                                              .defaultTextStyle
                                              .withFontSize(5.sp),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                            if (pickedData.id != 'empty')
                              if (true)
                                const Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                  height: 10,
                                ),
                          ],
                        ),
                      )),
                ],
              ),
            );
          default:
            return const Center(
              child: Text("lol"),
            );
        }
      },
    );
  }
}

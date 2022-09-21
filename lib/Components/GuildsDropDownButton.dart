import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/AdministrationGuild.dart';
import 'package:discordbotadminui/Services/DiscordBotApiService.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GuildsDropDownButton extends StatelessWidget {
  final Function guildIdCallback;
  const GuildsDropDownButton({Key? key, required this.guildIdCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.sp),
      child: FutureBuilder(
          future: DiscordBotApiService.fetchData<AdministrationGuild>(
              "https://localhost:5001/api/Get/SocketGuild"),
          builder:
              (context, AsyncSnapshot<List<AdministrationGuild>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                {
                  if (snapshot.data != null) {
                    if (snapshot.data!.isNotEmpty) {
                      guildIdCallback(snapshot.data!.first.id);
                    }
                  }
                  return DropdownButtonHideUnderline(
                      child: DropdownButton2(
                    items: snapshot.data == null || snapshot.data!.isEmpty
                        ? [
                            DropdownMenuItem<String>(
                              value: "No connected guild",
                              child: Text(
                                "No connected guild",
                                style: TextStyleHelper.get(context)
                                    .defaultTextInputStyle
                                    .withFontSize(6.sp),
                              ),
                            )
                          ]
                        : snapshot.data!
                            .map((e) => e.name)
                            .toList()
                            .map<DropdownMenuItem<String>>((dynamic value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyleHelper.get(context)
                                    .defaultTextInputStyle
                                    .withFontSize(5.sp),
                              ),
                            );
                          }).toList(),
                    value: snapshot.data == null || snapshot.data!.isEmpty
                        ? "No connected guild"
                        : snapshot.data!.first.name,
                    style: TextStyleHelper.get(context).defaultTextInputStyle,
                    onChanged: (value) {
                      if (snapshot.data != null) {
                        guildIdCallback(snapshot.data!
                            .firstWhere((element) => element.name == value)
                            .id);
                      }
                    },
                    barrierColor: ThemeManager.getTheme(context)
                        .dropdownButtonColors
                        .defaultBarrierColor,
                    iconSize: 4.sp,
                    iconEnabledColor: ThemeManager.getTheme(context)
                        .dropdownButtonColors
                        .defaultIconEnableColor,
                    iconDisabledColor: ThemeManager.getTheme(context)
                        .dropdownButtonColors
                        .defaultIconDisabledColor,
                    buttonHeight: 8.h,
                    buttonWidth: MediaQuery.of(context).size.width,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ThemeManager.getTheme(context).activeColor,
                      ),
                      color: Colors.transparent,
                    ),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: ThemeManager.getTheme(context).activeColor,
                    ),
                    dropdownMaxHeight: 200,
                    dropdownWidth: 24.w,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                  ));
                }
              case ConnectionState.waiting:
                {
                  return CircularProgressIndicator(
                    color: ThemeManager.getTheme(context).activeColor,
                  );
                }
              default:
                {
                  return Center(
                    child: Text("No data",
                        style: TextStyleHelper.get(context).defaultTextStyle),
                  );
                }
            }
          }),
    );
  }
}

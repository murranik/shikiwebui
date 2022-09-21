import 'package:discordbotadminui/Components/CreateThemeComponent.dart';
import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Managers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/CustomThemeData.dart';
import 'package:discordbotadminui/Provider/ThemeProvider.dart';
import 'package:discordbotadminui/Services/ThemesApiService.dart';
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
              style: TextStyleHelper.get(context).defaultTextStyle),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: ThemeManager.getTheme(context)
                              .floatingBoxColors
                              .defaultShadowColor,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: ThemeManager.getTheme(context)
                          .floatingBoxColors
                          .defaultBackgroundColor,
                    ),
                    width: 40.w,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Themes",
                            style:
                                TextStyleHelper.get(context).defaultTextStyle,
                          ),
                        ),
                        FutureBuilder(
                          future: ThemesApiService.getThemes(context),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<CustomThemeData>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator(
                                  color: ThemeManager.getTheme(context)
                                      .activeColor);
                            } else {
                              if (snapshot.hasData) {
                                return GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0,
                                  ),
                                  itemCount: snapshot.data!.length,
                                  padding: EdgeInsets.all(2.sp),
                                  itemBuilder: (context, index) {
                                    if (snapshot.data![index].name == "add") {
                                      return InkWell(
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const CreateThemeComponent();
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  ThemeManager.getTheme(context)
                                                      .floatingBoxColors
                                                      .defaultBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Icon(
                                            Icons.add,
                                            size: 10.sp,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return GestureDetector(
                                        onTap: () {
                                          themeNotifier.currentTheme =
                                              snapshot.data![index];
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            stops: const [.5, .5],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              snapshot.data![index]
                                                  .defaultAppBackGroundColor,
                                              snapshot.data![index].activeColor,
                                            ],
                                          ),
                                        )),
                                      );
                                    }
                                  },
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    'No data',
                                    style: TextStyleHelper.get(context)
                                        .defaultTextStyle
                                        .withColor(
                                            ThemeManager.getTheme(context)
                                                .cancelColor),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                        Center(
                          child: Text(
                            "Languages",
                            style:
                                TextStyleHelper.get(context).defaultTextStyle,
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

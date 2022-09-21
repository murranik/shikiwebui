import 'dart:math';

import 'package:discordbotadminui/Components/AuthPageInput.dart';
import 'package:discordbotadminui/Components/ColorTypesPreviews/ActiveColorPreview.dart';
import 'package:discordbotadminui/Components/ColorTypesPreviews/CancelColorPreview.dart';
import 'package:discordbotadminui/Components/ColorTypesPreviews/DataTablePreview.dart';
import 'package:discordbotadminui/Components/ColorTypesPreviews/DropDownButtonPreview.dart';
import 'package:discordbotadminui/Components/ColorTypesPreviews/NavMenuBackgroundColorPreview.dart';
import 'package:discordbotadminui/Components/ColorTypesPreviews/NavMenuTextColorPreview.dart';
import 'package:discordbotadminui/Components/ColorTypesPreviews/FloatingBoxColorPreview.dart';
import 'package:discordbotadminui/Components/ColorTypesPreviews/TextColorPreview.dart';
import 'package:discordbotadminui/Components/CreateThemeComponent/ExpandableCategoryItem.dart';
import 'package:discordbotadminui/Components/CreateThemeComponent/ExpandableListView.dart';
import 'package:discordbotadminui/Enums/DataTableCellColorType.dart';
import 'package:discordbotadminui/Enums/DropDownButtonPreviewColorTypes.dart';
import 'package:discordbotadminui/Enums/ValidationTypes.dart';
import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/CustomThemeData.dart';
import 'package:discordbotadminui/Models/DiscordRole.dart';
import 'package:discordbotadminui/Services/ThemesApiService.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' as m;
import 'package:sizer/sizer.dart';

class CreateThemeComponent extends StatefulWidget {
  const CreateThemeComponent({Key? key}) : super(key: key);

  @override
  State<CreateThemeComponent> createState() => _CreateThemeComponentState();
}

class _CreateThemeComponentState extends State<CreateThemeComponent> {
  var basicColorsExpandController = ExpandableController();
  var floatingBoxExpandController = ExpandableController();
  var dropdownExpandController = ExpandableController();
  var tableCellExpandController = ExpandableController();
  String? choosedColor;

  var pickerColor = Colors.white;
  late void Function(void Function()) updatePreview;
  late CustomThemeData tempTheme;
  final tableData = List.generate(5, (index) {
    var l = (Random().nextDouble() * 100000000000000).round();
    return DiscordRole(discordId: int.parse(l.toString()), name: "Name");
  });
  var textController = TextEditingController();
  var themeNameController = TextEditingController();
  @override
  void initState() {
    tempTheme = ThemeManager.getThemeCopy(context);
    super.initState();
  }

  void changeColor(Color color) {
    updatePreview(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
          width: 80.w,
          height: 80.h,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ThemeManager.getTheme(context)
                  .floatingBoxColors
                  .defaultBackgroundColor),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: Container(
                        child: ListView(
                      children: [
                        ExpandableCategoryItem(
                          categoryName: "Basic colors",
                          callback: () {
                            setState(() {});
                          },
                          expandController: basicColorsExpandController,
                        ),
                        ExpandableListView(
                            expandController: basicColorsExpandController,
                            pickedTextCallBack: (choosedColorText) {
                              choosedColor = choosedColorText;
                              pickerColor = ThemeManager.getColorByName(
                                  choosedColor!, context,
                                  theme: tempTheme);
                              setState(() {});
                            },
                            expandablesItemsData: const [
                              "Active color",
                              "Cancel/error color",
                              "Edit color",
                              "Text color",
                              "Nav menu text color",
                              "Nav menu background color",
                              "Background color",
                            ]),
                        ExpandableCategoryItem(
                          categoryName: "Floating box colors",
                          callback: () {
                            setState(() {});
                          },
                          expandController: floatingBoxExpandController,
                        ),
                        ExpandableListView(
                            expandController: floatingBoxExpandController,
                            pickedTextCallBack: (choosedColorText) {
                              choosedColor = choosedColorText;

                              pickerColor = ThemeManager.getColorByName(
                                  choosedColor!, context,
                                  theme: tempTheme);
                              setState(() {});
                            },
                            expandablesItemsData: const [
                              "Shadow color",
                              "Floating background color",
                            ]),
                        ExpandableCategoryItem(
                          categoryName: "Dropdown button colors",
                          callback: () {
                            setState(() {});
                          },
                          expandController: dropdownExpandController,
                        ),
                        ExpandableListView(
                            expandController: dropdownExpandController,
                            pickedTextCallBack: (choosedColorText) {
                              choosedColor = choosedColorText;

                              pickerColor = ThemeManager.getColorByName(
                                  choosedColor!, context,
                                  theme: tempTheme);
                              setState(() {});
                            },
                            expandablesItemsData: const [
                              "Barrier color",
                              "IconEnable color",
                              "IconDisabled color",
                            ]),
                        ExpandableCategoryItem(
                          categoryName: "Table cell colors",
                          callback: () {
                            setState(() {});
                          },
                          expandController: tableCellExpandController,
                        ),
                        ExpandableListView(
                            expandController: tableCellExpandController,
                            pickedTextCallBack: (choosedColorText) {
                              choosedColor = choosedColorText;

                              pickerColor = ThemeManager.getColorByName(
                                  choosedColor!, context,
                                  theme: tempTheme);
                              setState(() {});
                            },
                            expandablesItemsData: const [
                              "Box shadow color",
                              "Border color",
                              "Input text color",
                            ]),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        TextField(
                          controller: themeNameController,
                          style: TextStyleHelper.get(context)
                              .defaultTextInputStyle,
                          decoration: InputDecoration(
                              hintText: "Theme name",
                              hintStyle: TextStyleHelper.get(context)
                                  .defaultTextInputStyle
                                  .apply(
                                      color: ThemeManager.getTheme(context)
                                          .defaultTextColor
                                          .withAlpha(125)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: ThemeManager.getTheme(context)
                                          .activeColor)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: ThemeManager.getTheme(context)
                                          .activeColor)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide:
                                      BorderSide(color: ThemeManager.getTheme(context).activeColor)),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: ThemeManager.getTheme(context).activeColor))),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        TextButton(
                            onPressed: () async {
                              if (themeNameController.text.length > 5) {
                                tempTheme.name = themeNameController.text;
                                tempTheme.description =
                                    themeNameController.text;
                                tempTheme.floatingBoxColors.parentName =
                                    themeNameController.text;
                                tempTheme.floatingBoxColors.id = 0;
                                tempTheme.dataTableCellColors.parentName =
                                    themeNameController.text;

                                tempTheme.dataTableCellColors.id = 0;
                                tempTheme.dropdownButtonColors.parentName =
                                    themeNameController.text;

                                tempTheme.dropdownButtonColors.id = 0;
                                await ThemesApiService.saveTheme(tempTheme);
                                Navigator.of(context).pop();
                              }
                            },
                            child: Text(
                              "Save",
                              style:
                                  TextStyleHelper.get(context).defaultTextStyle,
                            )),
                        SizedBox(
                          height: 0.5.h,
                        ),
                      ],
                    ))),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                  width: 2,
                ),
                Expanded(
                  flex: 5,
                  child: choosedColor != null
                      ? StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) update) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    choosedColor!,
                                    textAlign: TextAlign.center,
                                    style: TextStyleHelper.get(context)
                                        .defaultTextStyle,
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      m.ColorPicker(
                                        pickerColor: pickerColor,
                                        onColorChanged: changeColor,
                                        colorPickerWidth: 300,
                                        pickerAreaHeightPercent: 0.7,
                                        enableAlpha: true,
                                        displayThumbColor: true,
                                        paletteType: m.PaletteType.hsvWithHue,
                                        labelTypes: const [],
                                        pickerAreaBorderRadius:
                                            const BorderRadius.only(
                                          topLeft: Radius.circular(2),
                                          topRight: Radius.circular(2),
                                        ),
                                        hexInputController: textController,
                                        portraitOnly: true,
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 0, 16, 16),
                                          child: CupertinoTextField(
                                              controller: textController,
                                              prefix: const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 8),
                                                  child: Icon(Icons.tag)),
                                              suffix: IconButton(
                                                icon: const Icon(Icons
                                                    .content_paste_rounded),
                                                onPressed: () {},
                                              ),
                                              autofocus: true,
                                              maxLength: 9,
                                              inputFormatters: [
                                                m.UpperCaseTextFormatter(),
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(
                                                        m.kValidHexPattern)),
                                              ]))
                                    ],
                                  )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            pickerColor =
                                                ThemeManager.getColorByName(
                                                    choosedColor!, context);
                                            setState(() {});
                                          },
                                          child: Text("Reset",
                                              style:
                                                  TextStyleHelper.get(context)
                                                      .defaultTextStyle
                                                      .withColor(
                                                        ThemeManager.getTheme(
                                                                context)
                                                            .cancelColor,
                                                      ))),
                                      TextButton(
                                          onPressed: () {
                                            setThemeColor();
                                            updatePreview(() {});
                                          },
                                          child: Text("Apply",
                                              style:
                                                  TextStyleHelper.get(context)
                                                      .defaultTextStyle
                                                      .withColor(
                                                        ThemeManager.getTheme(
                                                                context)
                                                            .activeColor,
                                                      )))
                                    ],
                                  )
                                ]);
                          },
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                "https://images-na.ssl-images-amazon.com/images/I/81MPrEl0F1L.png",
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                  width: 2,
                ),
                Expanded(
                  flex: 10,
                  child: choosedColor != null
                      ? StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) update) {
                            updatePreview = update;
                            if (choosedColor == "Text color") {
                              return TextColorPreview(
                                pickerColor: pickerColor,
                                theme: tempTheme,
                              );
                            } else if (choosedColor == "Active color") {
                              return ActiveColorPreview(
                                pickerColor: pickerColor,
                                theme: tempTheme,
                              );
                            } else if (choosedColor == "Background color") {
                              return Container(
                                color: pickerColor,
                                alignment: Alignment.center,
                              );
                            } else if (choosedColor ==
                                "Nav menu background color") {
                              return NavMenuBackgroundColorPreview(
                                pickerColor: pickerColor,
                                theme: tempTheme,
                              );
                            } else if (choosedColor == "Nav menu text color") {
                              return NavMenuTextColorPreview(
                                pickerColor: pickerColor,
                                theme: tempTheme,
                              );
                            } else if (choosedColor == "Cancel/error color") {
                              return CancelColorPreview(
                                pickerColor: pickerColor,
                                theme: tempTheme,
                              );
                            } else if (choosedColor == "Edit color") {
                              return Container(
                                color: tempTheme.defaultAppBackGroundColor,
                                child: Center(
                                  child: Icon(
                                    Icons.edit,
                                    color: pickerColor,
                                  ),
                                ),
                              );
                            } else if (choosedColor == "Shadow color") {
                              return FloatingBoxColorPreview(
                                pickerColor: pickerColor,
                                changeBackGround: false,
                                theme: tempTheme,
                              );
                            } else if (choosedColor ==
                                "Floating background color") {
                              return FloatingBoxColorPreview(
                                pickerColor: pickerColor,
                                changeBackGround: true,
                                theme: tempTheme,
                              );
                            } else if (choosedColor == "Barrier color") {
                              return DropDownButtonPreview(
                                pickerColor: pickerColor,
                                theme: tempTheme,
                                colorType:
                                    DropDownButtonPreviewColorTypes.barrier,
                              );
                            } else if (choosedColor == "IconEnable color") {
                              return DropDownButtonPreview(
                                pickerColor: pickerColor,
                                theme: tempTheme,
                                colorType:
                                    DropDownButtonPreviewColorTypes.iconEnabled,
                              );
                            } else if (choosedColor == "IconDisabled color") {
                              return DropDownButtonPreview(
                                pickerColor: pickerColor,
                                theme: tempTheme,
                                colorType: DropDownButtonPreviewColorTypes
                                    .iconDisabled,
                              );
                            } else if (choosedColor == "Box shadow color") {
                              return DataTablePreview(
                                data: tableData,
                                pickerColor: pickerColor,
                                theme: tempTheme,
                                type: DataTableCellColorType.boxShadow,
                              );
                            } else if (choosedColor == "Border color") {
                              return DataTablePreview(
                                data: tableData,
                                pickerColor: pickerColor,
                                theme: tempTheme,
                                type: DataTableCellColorType.border,
                              );
                            } else if (choosedColor == "Input text color") {
                              return DataTablePreview(
                                data: tableData,
                                pickerColor: pickerColor,
                                theme: tempTheme,
                                type: DataTableCellColorType.inputText,
                              );
                            } else {
                              return Container();
                            }
                          },
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                "https://picfiles.alphacoders.com/475/475580.jpg",
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                ),
              ],
            ),
          )),
    );
  }

  void setThemeColor() {
    switch (choosedColor) {
      case "Active color":
        tempTheme.activeColor = pickerColor;
        break;
      case "Cancel/error color":
        tempTheme.cancelColor = pickerColor;
        break;
      case "Edit color":
        tempTheme.editColor = pickerColor;
        break;
      case "Text color":
        tempTheme.defaultTextColor = pickerColor;
        break;
      case "Nav menu text color":
        tempTheme.defaultNavMenuTextColor = pickerColor;
        break;
      case "Nav menu background color":
        tempTheme.defaultNavMenuBackgroundColor = pickerColor;
        break;
      case "Background color":
        tempTheme.defaultAppBackGroundColor = pickerColor;
        break;
      case "Shadow color":
        tempTheme.floatingBoxColors.defaultShadowColor = pickerColor;
        break;
      case "Floating background color":
        tempTheme.floatingBoxColors.defaultBackgroundColor = pickerColor;
        break;
      case "Barrier color":
        tempTheme.dropdownButtonColors.defaultBarrierColor = pickerColor;
        break;
      case "IconEnable color":
        tempTheme.dropdownButtonColors.defaultIconEnableColor = pickerColor;
        break;
      case "IconDisabled color":
        tempTheme.dropdownButtonColors.defaultIconDisabledColor = pickerColor;
        break;
      case "Box shadow color":
        tempTheme.dataTableCellColors.defaultBoxShadowColor = pickerColor;
        break;
      case "Border color":
        tempTheme.dataTableCellColors.defaultBorderColor = pickerColor;
        break;
      case "Input text color":
        tempTheme.dataTableCellColors.defaultInputTextColor = pickerColor;
        break;
      default:
        return;
    }
  }
}

import 'package:discordbotadminui/Components/CreateThemeComponent/ExpandableCategoryItem.dart';
import 'package:discordbotadminui/Components/CreateThemeComponent/ExpandableListView.dart';
import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
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
  String? pickedColor = null;
  var r = 0.0;
  var g = 0.0;
  var b = 0.0;
  var alpha = 0.0;

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  var textController = TextEditingController();
// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
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
              color: ColorHelper.getColorHelper(context)
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
                            pickedTextCallBack: (pickedColorText) {
                              pickedColor = pickedColorText;
                              r = 0.0;
                              g = 0.0;
                              b = 0.0;
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
                            pickedTextCallBack: (pickedColorText) {
                              pickedColor = pickedColorText;
                              r = 0.0;
                              g = 0.0;
                              b = 0.0;
                              setState(() {});
                            },
                            expandablesItemsData: const [
                              "Shadow color",
                              "Background color",
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
                            pickedTextCallBack: (pickedColorText) {
                              pickedColor = pickedColorText;
                              r = 0.0;
                              g = 0.0;
                              b = 0.0;
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
                            pickedTextCallBack: (pickedColorText) {
                              pickedColor = pickedColorText;
                              r = 0.0;
                              g = 0.0;
                              b = 0.0;
                              setState(() {});
                            },
                            expandablesItemsData: const [
                              "Box shadow color",
                              "Border color",
                              "Input text color",
                              "Edit color",
                            ]),
                      ],
                    ))),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                  width: 2,
                ),
                Expanded(
                  flex: 5,
                  child: pickedColor != null
                      ? StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) update) {
                            return Column(children: [
                              Text(
                                pickedColor!,
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
                                              padding: EdgeInsets.only(left: 8),
                                              child: Icon(Icons.tag)),
                                          suffix: IconButton(
                                            icon: const Icon(
                                                Icons.content_paste_rounded),
                                            onPressed: () {},
                                          ),
                                          autofocus: true,
                                          maxLength: 9,
                                          inputFormatters: [
                                            m.UpperCaseTextFormatter(),
                                            FilteringTextInputFormatter.allow(
                                                RegExp(m.kValidHexPattern)),
                                          ]))
                                ],
                              ))
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
                  child: pickedColor != null
                      ? Container()
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
}

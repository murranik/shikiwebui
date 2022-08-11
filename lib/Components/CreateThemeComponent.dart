import 'package:discordbotadminui/Components/CreateThemeComponent/ExpandableCategoryItem.dart';
import 'package:discordbotadminui/Components/CreateThemeComponent/ExpandableItem.dart';
import 'package:discordbotadminui/Components/CreateThemeComponent/ExpandableListView.dart';
import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
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
                        ? Container()
                        : Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  "https://images-na.ssl-images-amazon.com/images/I/81MPrEl0F1L.png",
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center,
                                  isAntiAlias: true,
                                ),
                              )
                            ],
                          )),
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

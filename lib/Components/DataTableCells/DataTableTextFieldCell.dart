import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Managers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Interfaces/DataTableCellInterface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class DataTableTextFieldCell extends StatelessWidget
    implements DataTableCellInterface {
  @override
  Color? backgroundColor;

  @override
  int flex;

  @override
  String name;

  final TextEditingController editController;
  final Function save;

  DataTableTextFieldCell({
    Key? key,
    this.backgroundColor,
    this.flex = 3,
    required this.name,
    required this.editController,
    required this.save,
  }) : super(key: key);

  var enable = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
          //margin: EdgeInsets.all(1.sp),
          height: 7.sp,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: ThemeManager.getTheme(context)
                        .dataTableCellColors
                        .defaultBoxShadowColor)
              ],
              color: backgroundColor ?? Colors.transparent,
              border: Border.fromBorderSide(BorderSide(
                color: ThemeManager.getTheme(context)
                    .dataTableCellColors
                    .defaultBorderColor,
                width: 0.5.sp,
              ))),
          child: StatefulBuilder(
            builder:
                (BuildContext context, void Function(void Function()) update) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextField(
                    enabled: enable,
                    controller: editController,
                    textAlignVertical: TextAlignVertical.center,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration:
                        const InputDecoration(disabledBorder: InputBorder.none),
                    style: TextStyleHelper.get(context)
                        .defaultDataTableInputTextStyle
                        .withFontSize(4.sp),
                  )),
                  if (enable)
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.check,
                        color: ThemeManager.getTheme(context).activeColor,
                      ),
                      onPressed: () async {
                        enable = false;

                        await save();
                        update(() {});
                      },
                    )
                  else
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.edit,
                        color: ThemeManager.getTheme(context).editColor,
                      ),
                      onPressed: () {
                        enable = true;
                        update(() {});
                      },
                    )
                ],
              );
            },
          )),
    );
  }
}

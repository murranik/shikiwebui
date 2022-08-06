import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/ColorHelper.dart';
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
  DataTableTextFieldCell(
      {Key? key,
      this.backgroundColor,
      this.flex = 3,
      required this.name,
      required this.editController})
      : super(key: key);

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
                    color: ColorHelper.getColorHelper(context)
                        .dataTableCellColors
                        .defaultBoxShadowColor)
              ],
              color: backgroundColor ?? Colors.transparent,
              border: Border.fromBorderSide(BorderSide(
                color: ColorHelper.getColorHelper(context)
                    .dataTableCellColors
                    .defaultBorderColor,
                width: 0.5.sp,
              ))),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                controller: editController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: TextStyleHelper.getTextStyleHelper(context)
                    .defaultTextStyle
                    .withFontSize(4.sp),
              ))
            ],
          )),
    );
  }
}

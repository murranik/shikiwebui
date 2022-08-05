import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Interfaces/DataTableCellInterface.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DataTableCell extends StatelessWidget implements DataTableCellInterface {
  @override
  Color? backgroundColor;
  @override
  int flex;
  @override
  String name;

  DataTableCell(
      {Key? key, required this.name, this.backgroundColor, this.flex = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 7.sp,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: ColorHelper.dataTableCellColors.defaultBoxShadowColor)
            ],
            color: backgroundColor ?? Colors.transparent,
            border: Border.fromBorderSide(BorderSide(
              color: ColorHelper.dataTableCellColors.defaultBorderColor,
              width: 0.5.sp,
            ))),
        child: Text(
          name,
          style: TextStyleHelper.defaultTextStyle.withFontSize(4.sp),
        ),
      ),
    );
  }
}

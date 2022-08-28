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

  final Color? pickerColor;

  DataTableCell(
      {Key? key,
      required this.name,
      this.backgroundColor,
      this.flex = 3,
      this.pickerColor})
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
        child: Text(
          name,
          style:
              TextStyleHelper.get(context).defaultTextStyle.withFontSize(4.sp),
        ),
      ),
    );
  }
}

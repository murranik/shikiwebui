import 'package:discordbotadminui/Managers/ThemeManager.dart';
import 'package:discordbotadminui/Interfaces/DataTableCellInterface.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DataTableToolsCell extends StatefulWidget
    implements DataTableCellInterface {
  @override
  Color? backgroundColor;
  @override
  int flex;
  @override
  String name;

  final Function callBack;
  final Function save;
  final bool edit;

  DataTableToolsCell(
      {Key? key,
      required this.name,
      this.backgroundColor,
      this.flex = 3,
      required this.callBack,
      required this.edit,
      required this.save})
      : super(key: key);

  @override
  State<DataTableToolsCell> createState() => _DataTableToolsCellState();
}

class _DataTableToolsCellState extends State<DataTableToolsCell> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: ThemeManager.getTheme(context)
                        .dataTableCellColors
                        .defaultBoxShadowColor)
              ],
              color: widget.edit
                  ? ThemeManager.getTheme(context).editColor
                  : ThemeManager.getTheme(context)
                      .dataTableCellColors
                      .defaultBoxShadowColor,
              border: Border.fromBorderSide(BorderSide(
                color: ThemeManager.getTheme(context)
                    .dataTableCellColors
                    .defaultBorderColor,
                width: 0.5.sp,
              ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 6.sp,
                child: IconButton(
                    mouseCursor: SystemMouseCursors.click,
                    padding: EdgeInsets.zero,
                    iconSize: 5.sp,
                    splashRadius: 3.sp,
                    onPressed: () {
                      widget.callBack(!widget.edit);
                    },
                    icon: Icon(
                      widget.edit ? Icons.cancel : Icons.edit,
                      color: widget.edit
                          ? ThemeManager.getTheme(context).cancelColor
                          : ThemeManager.getTheme(context).activeColor,
                    )),
              ),
              if (widget.edit)
                SizedBox(
                  height: 6.sp,
                  child: IconButton(
                      mouseCursor: SystemMouseCursors.click,
                      padding: EdgeInsets.zero,
                      iconSize: 5.sp,
                      splashRadius: 3.sp,
                      onPressed: () {
                        if (widget.edit) {
                          widget.save();
                          widget.callBack(!widget.edit);
                        }
                      },
                      icon: Icon(
                        Icons.check_circle_outline,
                        color: ThemeManager.getTheme(context).activeColor,
                      )),
                )
            ],
          )),
    );
  }
}

import 'package:discordbotadminui/Enums/DataTableCellColorType.dart';
import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/CustomThemeData.dart';
import 'package:discordbotadminui/Models/DiscordRole.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class DataTablePreview extends StatefulWidget {
  final List<DiscordRole> data;
  final Color pickerColor;
  final CustomThemeData theme;
  final DataTableCellColorType type;
  const DataTablePreview(
      {Key? key,
      required this.data,
      required this.pickerColor,
      required this.theme,
      required this.type})
      : super(key: key);

  @override
  State<DataTablePreview> createState() => _DataTablePreviewState();
}

class _DataTablePreviewState extends State<DataTablePreview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var discordRole in widget.data)
          Builder(
            builder: (BuildContext context) {
              var enable = false;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                        //margin: EdgeInsets.all(1.sp),
                        height: 7.sp,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: widget.type ==
                                          DataTableCellColorType.boxShadow
                                      ? widget.pickerColor
                                      : widget.theme.dataTableCellColors
                                          .defaultBoxShadowColor)
                            ],
                            color: Colors.transparent,
                            border: Border.fromBorderSide(BorderSide(
                              color:
                                  widget.type == DataTableCellColorType.border
                                      ? widget.pickerColor
                                      : widget.theme.dataTableCellColors
                                          .defaultBorderColor,
                              width: 0.5.sp,
                            ))),
                        child: StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) update) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: TextField(
                                        enabled: enable,
                                        controller: TextEditingController(
                                            text: discordRole.name),
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: const InputDecoration(
                                            disabledBorder: InputBorder.none),
                                        style: widget.type ==
                                                DataTableCellColorType.inputText
                                            ? TextStyleHelper.get(context,
                                                    theme: widget.theme)
                                                .defaultDataTableInputTextStyle
                                                .withFontSize(4.sp)
                                                .withColor(widget.pickerColor)
                                            : TextStyleHelper.get(context,
                                                    theme: widget.theme)
                                                .defaultDataTableInputTextStyle
                                                .withFontSize(4.sp))),
                                if (enable)
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      Icons.check,
                                      color: widget.theme.activeColor,
                                    ),
                                    onPressed: () async {
                                      enable = false;
                                      update(() {});
                                    },
                                  )
                                else
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      Icons.edit,
                                      color: widget.theme.editColor,
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
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 7.sp,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: widget.type ==
                                        DataTableCellColorType.boxShadow
                                    ? widget.pickerColor
                                    : widget.theme.dataTableCellColors
                                        .defaultBoxShadowColor)
                          ],
                          color: Colors.transparent,
                          border: Border.fromBorderSide(BorderSide(
                            color: widget.type == DataTableCellColorType.border
                                ? widget.pickerColor
                                : widget.theme.dataTableCellColors
                                    .defaultBorderColor,
                            width: 0.5.sp,
                          ))),
                      child: Text(discordRole.discordId.toString(),
                          style: widget.type == DataTableCellColorType.inputText
                              ? TextStyleHelper.get(context,
                                      theme: widget.theme)
                                  .defaultDataTableInputTextStyle
                                  .withFontSize(4.sp)
                                  .withColor(widget.pickerColor)
                              : TextStyleHelper.get(context,
                                      theme: widget.theme)
                                  .defaultDataTableInputTextStyle
                                  .withFontSize(4.sp)),
                    ),
                  )
                ],
              );
            },
          )
      ],
    );
  }
}

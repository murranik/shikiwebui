import 'package:discordbotadminui/Enums/DropDownButtonPreviewColorTypes.dart';
import 'package:discordbotadminui/Helpers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/CustomThemeData.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DropDownButtonPreview extends StatefulWidget {
  final Color pickerColor;
  final CustomThemeData theme;
  final DropDownButtonPreviewColorTypes colorType;
  const DropDownButtonPreview(
      {Key? key,
      required this.pickerColor,
      required this.theme,
      required this.colorType})
      : super(key: key);

  @override
  State<DropDownButtonPreview> createState() => _DropDownButtonPreviewState();
}

class _DropDownButtonPreviewState extends State<DropDownButtonPreview> {
  @override
  Widget build(BuildContext context) {
    var itemsCount = 5;
    return Container(
      color: widget.theme.defaultAppBackGroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          DropdownButtonHideUnderline(
              child: DropdownButton2(
            items: List.generate(itemsCount, (index) => index.toString())
                .map((e) => e)
                .toList()
                .map<DropdownMenuItem<String>>((dynamic value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: TextStyleHelper.get(context, theme: widget.theme)
                        .defaultTextInputStyle),
              );
            }).toList(),
            value: '1',
            style: TextStyleHelper.get(context, theme: widget.theme)
                .defaultTextInputStyle,
            onChanged: (value) {},
            barrierColor:
                widget.colorType == DropDownButtonPreviewColorTypes.barrier
                    ? widget.pickerColor
                    : widget.theme.dropdownButtonColors.defaultBarrierColor,
            iconSize: 4.sp,
            iconEnabledColor:
                widget.colorType == DropDownButtonPreviewColorTypes.iconEnabled
                    ? widget.pickerColor
                    : widget.theme.dropdownButtonColors.defaultIconEnableColor,
            iconDisabledColor: widget.colorType ==
                    DropDownButtonPreviewColorTypes.iconDisabled
                ? widget.pickerColor
                : widget.theme.dropdownButtonColors.defaultIconDisabledColor,
            buttonHeight: 8.h,
            dropdownWidth: 20.w,
            buttonWidth: 20.w,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: widget.theme.activeColor,
              ),
              color: Colors.transparent,
            ),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: widget.theme.activeColor,
            ),
            dropdownMaxHeight: 200,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
          ))
        ],
      ),
    );
  }
}

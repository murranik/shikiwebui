import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExpandableCategoryItem extends StatefulWidget {
  final ExpandableController expandController;
  final VoidCallback callback;
  final String categoryName;
  const ExpandableCategoryItem(
      {Key? key,
      required this.expandController,
      required this.callback,
      required this.categoryName})
      : super(key: key);

  @override
  State<ExpandableCategoryItem> createState() => _ExpandableCategoryItemState();
}

class _ExpandableCategoryItemState extends State<ExpandableCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.expandController.toggle();
        widget.callback();
      },
      child: Container(
        padding: EdgeInsets.only(left: 0.5.w),
        color: ColorHelper.getColorHelper(context)
            .floatingBoxColors
            .defaultShadowColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.categoryName,
                style: TextStyleHelper.get(context)
                    .createThemeComponentStyles
                    .defaultExpandableListCategoryTextStyle,
                overflow: TextOverflow.ellipsis),
            !widget.expandController.value
                ? Icon(
                    Icons.arrow_drop_down,
                    color: ColorHelper.getColorHelper(context).activeColor,
                  )
                : Icon(
                    Icons.arrow_drop_up,
                    color: ColorHelper.getColorHelper(context).activeColor,
                  )
          ],
        ),
      ),
    );
  }
}

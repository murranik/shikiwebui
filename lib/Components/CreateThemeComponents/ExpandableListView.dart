import 'package:discordbotadminui/Components/CreateThemeComponents/ExpandableItem.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableListView extends StatelessWidget {
  final Color debugColor;
  final ExpandableController expandController;
  final List<String> expandablesItemsData;
  final Function pickedTextCallBack;
  const ExpandableListView(
      {Key? key,
      this.debugColor = Colors.transparent,
      required this.expandController,
      required this.expandablesItemsData,
      required this.pickedTextCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ExpandableNotifier(
        controller: expandController,
        child: Expandable(
          collapsed: Container(),
          expanded:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            for (var expandableItemData in expandablesItemsData)
              ExpandableItem(
                callback: (text) {
                  pickedTextCallBack(text);
                },
                text: expandableItemData,
              ),
          ]),
        ),
      ),
    );
  }
}

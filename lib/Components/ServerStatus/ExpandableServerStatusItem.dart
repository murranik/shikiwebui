import 'package:discordbotadminui/Components/Timer.dart';
import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:flutter/material.dart';

class ExpandableServerStatusItem extends StatefulWidget {
  final Function futureFunction;
  final String serverName;
  const ExpandableServerStatusItem(
      {Key? key, required this.futureFunction, required this.serverName})
      : super(key: key);

  @override
  State<ExpandableServerStatusItem> createState() =>
      _ExpandableServerStatusItemState();
}

class _ExpandableServerStatusItemState
    extends State<ExpandableServerStatusItem> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.futureFunction(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return Text(
            widget.serverName,
            style: TextStyleHelper.get(context).defaultServerStatusTextStyle,
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.serverName,
                style: TextStyleHelper.get(context)
                    .defaultServerStatusTextStyle
                    .withColor(ThemeManager.getTheme(context).cancelColor),
              ),
              RefreshTimer(
                  onEnd: () {
                    setState(() {});
                  },
                  seconds: 30,
                  textColor: ThemeManager.getTheme(context).cancelColor),
            ],
          );
        }
      },
    );
  }
}

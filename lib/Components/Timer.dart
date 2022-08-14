import 'dart:async';

import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:flutter/material.dart';

class RefreshTimer extends StatefulWidget {
  final Function onEnd;
  final int seconds;
  final String? timePrefix;
  final Color textColor;
  const RefreshTimer(
      {Key? key,
      required this.onEnd,
      required this.seconds,
      this.timePrefix,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  State<RefreshTimer> createState() => _RefreshTimerState();
}

class _RefreshTimerState extends State<RefreshTimer> {
  late Timer _timer;
  late int _countDownValue;

  @override
  void initState() {
    _countDownValue = widget.seconds;
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_countDownValue == 0) {
          setState(() {
            _countDownValue = widget.seconds;
            widget.onEnd();
          });
        } else {
          setState(() {
            _countDownValue--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${widget.timePrefix ?? ""} ${intToTimeLeft(_countDownValue)}",
      style: TextStyleHelper.get(context)
          .defaultServerStatusTextStyle
          .withColor(widget.textColor),
    );
  }

  String intToTimeLeft(int value) {
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);
    String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

    return secondsLeft;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

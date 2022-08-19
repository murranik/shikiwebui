import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Models/OverlayManagerData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:sizer/sizer.dart';

class OverlaysManager {
  static List<OverlayManagerData> overlays = [];

  static buildOverlay(BuildContext context, GlobalKey overlayTargetKey,
      {double? right,
      double? widht,
      double? top,
      double? bottom,
      required bool useKey,
      required Widget children,
      required String identifier}) {
    if (!overlays.any((element) => element.identifier == identifier)) {
      overlays.add(OverlayManagerData(
          identifier: identifier,
          overlayEntry: OverlayEntry(
              maintainState: true,
              builder: (context) => Builder(
                    builder: (context) {
                      final keyContext = overlayTargetKey.currentContext;
                      if (keyContext != null) {
                        final box = keyContext.findRenderObject() as RenderBox;
                        final pos = box.localToGlobal(Offset.zero);
                        return Positioned(
                          bottom: useKey ? bottom : 1.h,
                          top: useKey ? pos.dy + box.size.height + 1 : top,
                          right: right,
                          width: widht,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorHelper.getColorHelper(context)
                                    .dataTableCellColors
                                    .defaultBoxShadowColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: children,
                          ),
                        );
                      }
                      return Container();
                    },
                  ))));
    } else {
      print("Overlay already exist");
    }
  }

  static showOverlay(String identifier, BuildContext context) {
    var tempOverlay = overlays
        .firstWhere((element) => element.identifier == identifier)
        .overlayEntry;
    if (tempOverlay!.mounted) {
      tempOverlay.remove();
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Overlay.of(context)!.insert(tempOverlay);
      });
    }
  }
}

import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle withFontSize(double size) {
    return copyWith(fontSize: size);
  }
}

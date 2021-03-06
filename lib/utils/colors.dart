import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';
//import 'package:filcnaplo/ui/theme.dart';

Color textColor(Color color) {
  if (color == null) return null;
  return color.computeLuminance() >= 0.5 ? Colors.black : Colors.white;
}

Color stringToColor(String str) {
  if (str == null) return null;
  int hash = 0;

  for (int i = 0; i < str.length; i++) {
    hash = str.codeUnitAt(i) + ((hash << 5) - hash);
  }

  String color = '#';

  for (int i = 0; i < 3; i++) {
    var value = (hash >> (i * 8)) & 0xFF;
    color += value.toRadixString(16);
  }

  color += "000000";
  color = color.substring(0, 7);

  return TinyColor.fromString(color).color;
}

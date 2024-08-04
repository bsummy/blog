import 'package:flutter/material.dart';

class ColorManagement {
  final String uniqueKey;

  ColorManagement(this.uniqueKey);

  Map<String, Color> colorMap = {
    "Hockey": Colors.red,
    "Basketball": Colors.green,
    "Soccer": Colors.blue,
  };

  Color? getColorByKey(String key) {
    return colorMap[key];
  }
}

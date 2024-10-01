import 'package:flutter/material.dart';

class ColorManagement {
  static const Map<String, Color> categoryColors = {
    'Introduction': Colors.blue,
    'Boston': Color.fromARGB(255, 189, 48, 57),
    'Montreal': Color.fromARGB(255, 0, 61, 165),
    'Chicago': Color.fromARGB(255, 65, 182, 230),
    'Finland': Color.fromARGB(255, 0, 200, 83),
    'Software Engineering': Color.fromARGB(255, 83, 198, 114),
    'Music': Color.fromARGB(255, 156, 2, 234),
    'Cooking': Color.fromARGB(255, 255, 87, 34),
    'Study Abroad': Color.fromARGB(255, 255, 193, 7),
  };

  Color getColorByKey(String key) {
    return categoryColors[key] ?? Colors.grey;
  }
}

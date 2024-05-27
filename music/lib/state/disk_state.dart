import 'package:flutter/material.dart';

class DiskState extends ChangeNotifier {
  late Record leftRecord;
  late Record rightRecord;

  void setIsPlaying(Record record, {bool isLeft = true}) {
    // uses a boolean to set the side because its easier that way
    if (isLeft) {
      leftRecord = record;
    } else {
      rightRecord = record;
    }
    notifyListeners();
  }
}

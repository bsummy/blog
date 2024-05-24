import 'package:flutter/material.dart';

class PlaybackState extends ChangeNotifier {

  bool isLeftPlaying = false;
  bool isRightPlaying = false;

  void setIsPlaying(bool value, bool isLeft) {
    if (isLeft) {
      isLeftPlaying = value;
    } else {
      isRightPlaying = value;
    }

    notifyListeners();


  }
}

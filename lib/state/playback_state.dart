import 'package:flutter/material.dart';

class PlaybackState extends ChangeNotifier {

  bool isLeftPlaying = false;
  bool isRightPlaying = false;

  void setIsPlaying(bool value, {bool isLeft = true}) {
    // uses a boolean to set the side because its easier that way
    if (isLeft) {
      isLeftPlaying = value;
    } else {
      isRightPlaying = value;
    }

    notifyListeners();
  }
}

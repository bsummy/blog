import 'package:flutter/material.dart';
import '../album/vinyl.dart';

class DiskState extends ChangeNotifier {
  Vinyl? leftVinyl;
  Vinyl? rightVinyl;

  void setVinyl(Vinyl? vinyl, {bool isLeft = true}) {
    // uses a boolean to set the side because its easier that way
    if (isLeft) {
      leftVinyl = vinyl;
    } else {
      rightVinyl = vinyl;
    }
    notifyListeners();
  }

  void removeVinyl({bool isLeft = true}) {
    // uses a boolean to set the side because its easier that way
    if (isLeft) {
      leftVinyl = null;
    } else {
      rightVinyl = null;
    }
    notifyListeners();
  }

  Vinyl? getVinyl({bool isLeft = true}) {
    // uses a boolean to set the side because its easier that way
    if (isLeft) {
      return leftVinyl;
    } else {

      return rightVinyl;
    }
  }
}

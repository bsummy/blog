
import 'package:flutter/material.dart';

class RecordClipper extends CustomClipper<Path> {
  final double _recordTop;

  RecordClipper(this._recordTop);

  @override
  Path getClip(Size size) {
    final path = Path();
    final recordHeight =
        size.height; // Assuming record height matches widget height

    // Record partially exiting
    final clipTop = recordHeight - (_recordTop.abs());
   print(recordHeight);
   print(_recordTop);
    path.addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    path.moveTo(size.width, clipTop);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(RecordClipper oldClipper) =>
      _recordTop != oldClipper._recordTop;
}


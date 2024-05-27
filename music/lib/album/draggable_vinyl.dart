import 'package:flutter/material.dart';
import 'package:music/album/vinyl.dart';

class DraggableVinyl extends StatelessWidget {
  final Color color;
  final String blogName;
  final String date;

  const DraggableVinyl(
      {super.key,
      required this.color,
      required this.blogName,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Draggable<Vinyl>(
      data: Vinyl(color: color, blogName: blogName, date: date),
      feedback:
          Vinyl(color: color, blogName: blogName, date: date),
      childWhenDragging: Container(),
      onDragEnd: (details) {
        // Handle drag end (optional)
      },
      child: Vinyl(color: color, blogName: blogName, date: date),
    );
  }
}

import 'package:flutter/material.dart';
import 'vinyl.dart';

class DraggableVinyl extends StatelessWidget {
  final Color color;
  final String postPath;
  final String blogName;
  final String date;

  const DraggableVinyl(
      {super.key,
      required this.color,
      required this.postPath,
      required this.blogName,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Draggable<Vinyl>(
      data: Vinyl(color: color, postPath: postPath, blogName: blogName, date: date),
      feedback:
          Vinyl(color: color, postPath: postPath, blogName: blogName, date: date),
      childWhenDragging: Container(),
      onDragEnd: (details) {
        // Handle drag end (optional)
      },
      child: Vinyl(color: color, postPath: postPath, blogName: blogName, date: date),
    );
  }
}

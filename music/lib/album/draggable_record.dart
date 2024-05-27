import 'package:flutter/material.dart';
import 'package:music/album/record.dart';

class DraggableRecord extends StatelessWidget {
  final Color color;
  final String blogName;
  final String date;

  const DraggableRecord(
      {super.key,
      required this.color,
      required this.blogName,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Draggable<Record>(
      data: Record(color: color, blogName: blogName, date: date),
      feedback:
          Record(color: color, blogName: blogName, date: date),
      childWhenDragging: Container(),
      onDragEnd: (details) {
        // Handle drag end (optional)
      },
      child: Record(color: color, blogName: blogName, date: date),
    );
  }
}

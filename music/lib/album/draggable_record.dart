import 'package:flutter/material.dart';
import 'package:music/album/record.dart';

class DraggableRecord extends StatelessWidget {
  final Color color;
  final String albumName;
  final String artistName;

  const DraggableRecord(
      {super.key,
      required this.color,
      required this.albumName,
      required this.artistName});

  @override
  Widget build(BuildContext context) {
    return Draggable<Record>(
      data: Record(color: color, albumName: albumName, artistName: artistName),
      feedback:
          Record(color: color, albumName: albumName, artistName: artistName),
      childWhenDragging: Container(),
      onDragEnd: (details) {
        // Handle drag end (optional)
      },
      child: Record(color: color, albumName: albumName, artistName: artistName),
    );
  }
}

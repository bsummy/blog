import 'package:flutter/material.dart';
import 'package:music/album/record.dart';
import 'package:music/turntable/infinite_animation.dart';

class RotatingDisk extends StatefulWidget {
  final bool isPlaying;
  final Record? record;

  const RotatingDisk(
      {super.key, required this.isPlaying, required this.record});

  @override
  _RotatingDiskState createState() => _RotatingDiskState();
}

// a disk is the record on the turntable
class _RotatingDiskState extends State<RotatingDisk> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // remove the record from the disk
          // setState(() {
          //   // this needs to be fixed later because it looks buggy when the record is removed
          //   widget.record = null;
          // });
        },
        child: (widget.isPlaying)
            ? InfiniteAnimation(
                durationInSeconds: 20, // this is the default value
                child: Container(
                  child: widget.record,
                ),
              )
            : Container(
                child: widget.record,
              ));
  }
}

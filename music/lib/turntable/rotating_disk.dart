import 'package:flutter/material.dart';
import 'package:music/turntable/infinite_animation.dart';
import 'package:music/state/disk_state.dart';
import 'package:provider/provider.dart';


class RotatingDisk extends StatefulWidget {
  final bool isPlaying;
  final bool isLeft;

  const RotatingDisk(
      {super.key, required this.isPlaying, required this.isLeft});

  @override
  _RotatingDiskState createState() => _RotatingDiskState();
}

// a disk is the vinyl on the turntable
class _RotatingDiskState extends State<RotatingDisk> {
  @override
  Widget build(BuildContext context) {
     final DiskState diskState = Provider.of<DiskState>(context);
    return GestureDetector(
        onTap: () {
          // remove the vinyl from the disk
          diskState.removeVinyl(isLeft: widget.isLeft);
        },
        child: (widget.isPlaying)
            ? InfiniteAnimation(
                durationInSeconds: 20, // this is the default value
                child: Container(
                  child: diskState.getVinyl(isLeft: widget.isLeft),
                ),
              )
            : Container(
                child: diskState.getVinyl(isLeft: widget.isLeft),
              ));
  }
}

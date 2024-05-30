
import 'package:flutter/material.dart';
import '../album/vinyl.dart';
import '../state/disk_state.dart';
import '../state/playback_state.dart';
import 'rotating_disk.dart';
import 'package:provider/provider.dart';
import 'package:flutter_circular_text/circular_text.dart';


class Disk extends StatefulWidget {
  final bool isLeft;

  const Disk({
    super.key,
    required this.isLeft,
  });

  @override
  State<Disk> createState() => _DiskState();
}

class _DiskState extends State<Disk> {
  Vinyl? vinyl;
  String? albumName;

  @override
  Widget build(BuildContext context) {
    final PlaybackState playbackState = Provider.of<PlaybackState>(context);
    final DiskState diskState = Provider.of<DiskState>(context);

    return DragTarget<Vinyl>(

      // Wrap with DragTarget
      onAcceptWithDetails: (details) {
        vinyl = details.data as Vinyl?;
        diskState.setVinyl(vinyl, isLeft: widget.isLeft);
      },

      builder: (context, candidateData, rejectedData) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[700],
          ),
          child: Stack(children: [
            Center(
              child: FractionallySizedBox(
                widthFactor: .9,
                heightFactor: .9,
                child: Center(
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[800],
                      ),
                    ),
                    CircularText(children: [
                      TextItem(
                        text: const Text(
                          "Drag a Vinyl Here...",
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xFF9E9E9E),
                          ),
                        ),
                        space: 16,
                        startAngle: -90,
                        startAngleAlignment: StartAngleAlignment.center,
                        direction: CircularTextDirection.clockwise,
                      ),
                    ]),
                  ]),
                ),
              ),
            ),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.05,
                heightFactor: 0.05,
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            if (diskState.leftVinyl != null && widget.isLeft)
              RotatingDisk(
                  isPlaying: playbackState.isLeftPlaying, isLeft: true)
            else if (diskState.rightVinyl != null && !widget.isLeft)
              RotatingDisk(
                  isPlaying: playbackState.isRightPlaying, isLeft: false)
          ]),
        ),
      ),
    );
  }
}

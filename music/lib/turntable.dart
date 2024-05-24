import 'package:flutter/material.dart';
import 'package:music/play_button.dart';
import 'package:music/record.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:music/rotating_disk.dart';
import 'package:music/playback_state.dart';
import 'package:provider/provider.dart';

class Turntable extends StatelessWidget {
  const Turntable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[800],
      ),
      child: const Stack(
        children: [
          Center(child: PlayButton()),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Disk(side: 'left'),
                ),
                Flexible(
                  child: Disk(side: 'right'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Disk extends StatefulWidget {
  final String side; // Make the 'side' field final

  const Disk({
    super.key,
    required this.side,
  });

  @override
  State<Disk> createState() => _DiskState();
}

class _DiskState extends State<Disk> {
  Record? record;
  String? albumName;
  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    final PlaybackState playbackState = Provider.of<PlaybackState>(context);

    return DragTarget<Record>(
      // Wrap with DragTarget

      onAcceptWithDetails: (details) {
        setState(() {
          record = details.data;
          albumName = record?.albumName;
        });
      },
      builder: (context, candidateData, rejectedData) => Container(
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
                        "Drag an Album Here...",
                        style: TextStyle(
                          fontSize: 28,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                      space: 18,
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
          if (record != null && widget.side == 'left')
            RotatingDisk(isPlaying: playbackState.isLeftPlaying, record: record)
          else if (record != null && widget.side == 'right')
            RotatingDisk(
                isPlaying: playbackState.isRightPlaying, record: record)
        ]),
      ),
    );
  }
}

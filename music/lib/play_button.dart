import 'package:flutter/material.dart';
import 'package:music/playback_state.dart';
import 'package:provider/provider.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({super.key});

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool isPlayingLeft = false;
  bool isPlayingRight = false;

  @override
  Widget build(BuildContext context) {
    final PlaybackState playbackState = Provider.of<PlaybackState>(context);
    return Container(
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  playbackState.isLeftPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    if (playbackState.isRightPlaying) {
                      playbackState.setIsPlaying(false, false);
                      playbackState.setIsPlaying(true, true);
                    } else {
                      playbackState.setIsPlaying(
                          !playbackState.isLeftPlaying, true);
                    }
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  playbackState.isRightPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    if (playbackState.isLeftPlaying) {
                      playbackState.setIsPlaying(false, true);
                      playbackState.setIsPlaying(true, false);
                    } else {
                      playbackState.setIsPlaying(
                          !playbackState.isRightPlaying, false);
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

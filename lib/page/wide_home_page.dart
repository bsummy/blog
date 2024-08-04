import 'package:flutter/material.dart';
import 'package:music/blog/blog_display.dart';
import 'package:music/blog_management/blog_management.dart';
import '../turntable/turntable.dart';
import 'package:provider/provider.dart';
import '../state/disk_state.dart';
import '../state/playback_state.dart';

class WideHomePage extends StatefulWidget {
  const WideHomePage({super.key});

  @override
  State<WideHomePage> createState() => _WideHomePageState();
}

class _WideHomePageState extends State<WideHomePage> {
  @override
  Widget build(BuildContext context) {
    PlaybackState playbackState = Provider.of<PlaybackState>(context);
    DiskState diskState = Provider.of<DiskState>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Column(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Turntable(),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                child:
                    SizedBox(width: 500, height: 500, child: BlogManagement()),
              ),
            ),
          ],
        ),
        if (diskState.getVinyl(isLeft: true) != null &&
            playbackState.isLeftPlaying)
          Expanded(child: BlogDisplay(vinyl: diskState.getVinyl(isLeft: true)))
        else if (diskState.getVinyl(isLeft: false) != null &&
            playbackState.isRightPlaying)
          Expanded(child: BlogDisplay(vinyl: diskState.getVinyl(isLeft: false)))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music/blog/blog_display.dart';
import 'package:music/blog_management/blog_management.dart';
import '../turntable/turntable.dart';
import 'package:provider/provider.dart';
import '../state/disk_state.dart';
import '../state/playback_state.dart';

class NarrowHomePage extends StatefulWidget {
  const NarrowHomePage({super.key});

  @override
  State<NarrowHomePage> createState() => _NarrowHomePageState();
}

class _NarrowHomePageState extends State<NarrowHomePage> {
  @override
  Widget build(BuildContext context) {
    PlaybackState playbackState = Provider.of<PlaybackState>(context);
    DiskState diskState = Provider.of<DiskState>(context);

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Turntable(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
              child: SizedBox(width: 500, height: 500, child: BlogManagement()),
            ),
            if (diskState.getVinyl(isLeft: true) != null &&
                playbackState.isLeftPlaying)
              BlogDisplay(vinyl: diskState.getVinyl(isLeft: true))
            else if (diskState.getVinyl(isLeft: false) != null &&
                playbackState.isRightPlaying)
              BlogDisplay(vinyl: diskState.getVinyl(isLeft: false))
          ],
        ),
      ),
    );
  }
}

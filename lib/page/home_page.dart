import 'package:flutter/material.dart';
import 'package:music/album/wrapped_album.dart';
import '../blog/blog_vinyl.dart';
import '../misc/album_shelf.dart';
import '../turntable/turntable.dart';
import 'package:provider/provider.dart';
import '../state/disk_state.dart';
import '../state/playback_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: SizedBox(
                width: 500,
                height: 500,
                child: AlbumShelf(albums: <WrappedAlbum>[
                  WrappedAlbum(
                    blogName: "Let's Start Here",
                    postPath: 'blog1',
                    date: '05-27-2024',
                    color: Colors.blueGrey,
                  ),
                  WrappedAlbum(
                    blogName: 'Tech Talk',
                    postPath: 'blog2',
                    date: '05-30-2024',
                    color: Colors.green,
                  ),
                  WrappedAlbum(
                    blogName: '3 Feet High And Rising',
                    postPath: 'blog3',
                    date: '05-28-2024',
                    color: Colors.yellow,
                  ),
                  WrappedAlbum(
                    blogName: "Future Me Hates Me",
                    postPath: 'blog4',
                    date: '05-28-2024',
                    color: Colors.yellow,
                  ),
                  WrappedAlbum(
                    blogName: 'Atavista',
                    postPath: 'blog5',
                    date: '05-28-2024',
                    color: Colors.white,
                  ),
                  WrappedAlbum(
                    blogName: "Light Upon The Lake",
                    postPath: 'blog6',
                    date: '05-28-2024',
                    color: Colors.white,
                  ),
                  WrappedAlbum(
                    blogName: "The Lost Boy",
                    postPath: 'blog7',
                    date: '05-28-2024',
                    color: Colors.blue,
                  ),
                  WrappedAlbum(
                    blogName: "Coloring Book",
                    postPath: 'blog8',
                    date: '05-28-2024',
                    color: Colors.pink,
                  ),
                  WrappedAlbum(
                    blogName: "Care For Me",
                    postPath: 'blog9',
                    date: '05-28-2024',
                    color: Colors.grey,
                  ),
                ]),
              ),
            ),
            if (diskState.getVinyl(isLeft: true) != null &&
                playbackState.isLeftPlaying)
              BlogVinyl(vinyl: diskState.getVinyl(isLeft: true))
            else if (diskState.getVinyl(isLeft: false) != null &&
                playbackState.isRightPlaying)
              BlogVinyl(vinyl: diskState.getVinyl(isLeft: false))
          ],
        ),
      ),
    );
  }
}

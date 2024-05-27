import 'package:flutter/material.dart';
import '../album/album.dart';
import '../blog/blog_vinyl.dart';
import '../misc/album_shelf.dart';
import '../misc/nav_bar.dart';
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

    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: NavBar(),
        ),
        body: SingleChildScrollView(
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
                    child: AlbumShelf(albums: <Album>[
                      Album(
                        blogName: "Let's Start Here",
                        imagePath: 'LetsStartHere',
                        postPath: 'blog1',
                        date: 'Lil Yachty',
                        color: Colors.blueGrey,
                      ),
                      Album(
                        blogName: 'MM...FOOD',
                        imagePath: 'MM...Food',
                        postPath: 'blog1',
                        date: 'MF DOOM',
                        color: Colors.green,
                      ),
                      Album(
                        blogName: '3 Feet High And Rising',
                        imagePath: '3FeetHighAndRising',
                        postPath: 'blog1',
                        date: 'De La Soul',
                        color: Colors.yellow,
                      ),
                      Album(
                        blogName: "Future Me Hates Me",
                        imagePath: 'FutureMeHatesMe',
                        postPath: 'blog1',
                        date: 'The Beths',
                        color: Colors.yellow,
                      ),
                      Album(
                        blogName: 'Atavista',
                        imagePath: 'Atavista',
                        postPath: 'blog1',
                        date: 'Childish Gambino',
                        color: Colors.white,
                      ),
                      Album(
                        blogName: "Light Upon The Lake",
                        imagePath: 'LightUponTheLake',
                        postPath: 'blog1',
                        date: 'Whitney',
                        color: Colors.white,
                      ),
                      Album(
                        blogName: "The Lost Boy",
                        imagePath: 'TheLostBoy',
                        postPath: 'blog1',
                        date: 'Cordae',
                        color: Colors.blue,
                      ),
                      Album(
                        blogName: "Coloring Book",
                        imagePath: 'ColoringBook',
                        postPath: 'blog1',
                        date: 'Chance The Rapper',
                        color: Colors.pink,
                      ),
                      Album(
                        blogName: "Care For Me",
                        imagePath: 'CareForMe',
                        postPath: 'blog1',
                        date: 'Saba',
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
        ));
  }
}

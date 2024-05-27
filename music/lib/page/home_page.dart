import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music/album/album.dart';
import 'package:music/misc/album_shelf.dart';
import 'package:music/misc/nav_bar.dart';
import 'package:music/turntable/turntable.dart';
import 'package:provider/provider.dart';
import 'package:music/state/disk_state.dart';
import 'package:music/state/playback_state.dart';

import 'package:music/blog/blog_display.dart';

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
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    width: 500,
                    height: 500,
                    child: AlbumShelf(albums: <Album>[
                      Album(
                        blogName: "Let's Start Here",
                        imagePath: 'LetsStartHere',
                        date: 'Lil Yachty',
                        color: Colors.blueGrey,
                      ),
                      Album(
                        blogName: 'MM...FOOD',
                        imagePath: 'MM...Food',
                        date: 'MF DOOM',
                        color: Colors.green,
                      ),
                      Album(
                        blogName: '3 Feet High And Rising',
                        imagePath: '3FeetHighAndRising',
                        date: 'De La Soul',
                        color: Colors.yellow,
                      ),
                      Album(
                        blogName: "Future Me Hates Me",
                        imagePath: 'FutureMeHatesMe',
                        date: 'The Beths',
                        color: Colors.yellow,
                      ),
                      Album(
                        blogName: 'Atavista',
                        imagePath: 'Atavista',
                        date: 'Childish Gambino',
                        color: Colors.white,
                      ),
                      Album(
                        blogName: "Light Upon The Lake",
                        imagePath: 'LightUponTheLake',
                        date: 'Whitney',
                        color: Colors.white,
                      ),
                      Album(
                        blogName: "The Lost Boy",
                        imagePath: 'TheLostBoy',
                        date: 'Cordae',
                        color: Colors.blue,
                      ),
                      Album(
                        blogName: "Coloring Book",
                        imagePath: 'ColoringBook',
                        date: 'Chance The Rapper',
                        color: Colors.pink,
                      ),
                      Album(
                        blogName: "Care For Me",
                        imagePath: 'CareForMe',
                        date: 'Saba',
                        color: Colors.grey,
                      ),
                    ]),
                  ),
                ),
                if (diskState.getVinyl(isLeft: true) != null &&
                    playbackState.isLeftPlaying)
                  const BlogDisplay(
                    markdownFilePath: "blog1",
                    blogName: "Blog Post 1",
                    date: "2024-05-25",
                  ),
              ],
            ),
          ),
        ));
  }
}

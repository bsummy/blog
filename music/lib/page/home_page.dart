import 'package:flutter/material.dart';
import 'package:music/album/album.dart';
import 'package:music/misc/album_shelf.dart';
import 'package:music/misc/nav_bar.dart';
import 'package:music/turntable/turntable.dart';
import 'package:music/blog/blog_display.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: NavBar(),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Turntable(),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 500,
                    height: 500,
                    child: AlbumShelf(albums: <Album>[
                      Album(
                        albumName: "Let's Start Here",
                        imagePath: 'LetsStartHere',
                        artistName: 'Lil Yachty',
                        color: Colors.blueGrey,
                      ),
                      Album(
                        albumName: 'MM...FOOD',
                        imagePath: 'MM...Food',
                        artistName: 'MF DOOM',
                        color: Colors.green,
                      ),
                      Album(
                        albumName: '3 Feet High And Rising',
                        imagePath: '3FeetHighAndRising',
                        artistName: 'De La Soul',
                        color: Colors.yellow,
                      ),
                      Album(
                        albumName: "Future Me Hates Me",
                        imagePath: 'FutureMeHatesMe',
                        artistName: 'The Beths',
                        color: Colors.yellow,
                      ),
                      Album(
                        albumName: 'Atavista',
                        imagePath: 'Atavista',
                        artistName: 'Childish Gambino',
                        color: Colors.white,
                      ),
                      Album(
                        albumName: "Light Upon The Lake",
                        imagePath: 'LightUponTheLake',
                        artistName: 'Whitney',
                        color: Colors.white,
                      ),
                      Album(
                        albumName: "The Lost Boy",
                        imagePath: 'TheLostBoy',
                        artistName: 'Cordae',
                        color: Colors.blue,
                      ),
                      Album(
                        albumName: "Coloring Book",
                        imagePath: 'ColoringBook',
                        artistName: 'Chance The Rapper',
                        color: Colors.pink,
                      ),
                      Album(
                        albumName: "Care For Me",
                        imagePath: 'CareForMe',
                        artistName: 'Saba',
                        color: Colors.grey,
                      ),
                    ]),
                  ),
                ),
                // BlogDisplay(
                //   markdownFilePath: "../assets/posts/blog1",
                //   title: "Blog Post 1",
                //   date: "2024-05-25",
                // ),
              ],
            ),
          ),
        ));
  }
}

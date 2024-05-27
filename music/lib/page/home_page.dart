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

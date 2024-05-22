import 'package:flutter/material.dart';
import 'package:music/album.dart';
import 'package:music/album_shelf.dart';
import 'package:music/turntable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(250, 93, 82, 1),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontSize: 20,
          ),
          title: const Text('Music'),
        ),
        body: const Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(20.0), child: Turntable()),
              SizedBox(
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
            ],
          ),
        ),
      ),
    );
  }
}

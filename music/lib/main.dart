import 'package:flutter/material.dart';
import 'package:music/album.dart';
import 'package:music/album_shelf.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontSize: 20,
          ),
          title: const Text('Music'),
        ),
        body: const Center(
          child: SizedBox(
            width: 900,
            height: 900,
            child: AlbumShelf(albums: <Album>[
              Album(
                albumName: "Let's Start Here",
                imagePath: '../assets/albums/LetsStartHere.jpeg',
              ),
              Album(
                albumName: 'MM...FOOD',
                imagePath: '../assets/albums/MM...Food.jpeg',
              ),
              Album(
                albumName: '3 Feet High And Rising',
                imagePath: '../assets/albums/3FeetHighAndRising.jpeg',
              ),
              Album(
                albumName: "Future Me Hates Me",
                imagePath: '../assets/albums/FutureMeHatesMe.jpeg',
              ),
              Album(
                albumName: 'Atavista',
                imagePath: '../assets/albums/Atavista.jpeg',
              ),
              Album(
                albumName: "Light Upon The Lake",
                imagePath: '../assets/albums/LightUponTheLake.jpeg',
              ),
              Album(
                albumName: "The Lost Boy",
                imagePath: '../assets/albums/TheLostBoy.jpeg',
              ),
              Album(
                albumName: "Coloring Book",
                imagePath: '../assets/albums/ColoringBook.jpeg',
              ),
              Album(
                albumName: "Care For Me",
                imagePath: '../assets/albums/CareForMe.jpeg',
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

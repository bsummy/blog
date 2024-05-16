import 'package:flutter/material.dart';

class Album extends StatefulWidget {
  final String albumName;
  final String imagePath;

  const Album({Key? key, required this.albumName, required this.imagePath})
      : super(key: key);

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0), // Add rounded corners

      child: Image.asset(
        widget.imagePath,
        width: 200.0,
        height: 200.0,
      ),
    );
  }
}

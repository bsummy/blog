import 'package:flutter/material.dart';
import 'package:music/album.dart';

class AlbumShelf extends StatelessWidget {
  final List<Album> albums;
  final double spacing;

  const AlbumShelf({Key? key, required this.albums, this.spacing = 10.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // 3 columns for the grid
      mainAxisSpacing: spacing, // Spacing between rows
      crossAxisSpacing: spacing, // Spacing between columns
      children: albums.map((album) => album).toList(),
    );
  }
}

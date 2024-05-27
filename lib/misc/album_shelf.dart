import 'package:flutter/material.dart';
import '../album/album.dart';

class AlbumShelf extends StatelessWidget {
  final List<Album> albums;
  final double spacing;

  const AlbumShelf({super.key, required this.albums, this.spacing = 10.0});

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

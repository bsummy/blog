import 'package:flutter/material.dart';
import 'package:music/album/wrapped_album.dart';

class AlbumShelf extends StatelessWidget {
  final List<WrappedAlbum> albums;
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

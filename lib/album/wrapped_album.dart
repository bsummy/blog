import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'album.dart';

class WrappedAlbum extends StatefulWidget {
  final String blogName;
  final String postPath;
  final String date;
  final String category;

  const WrappedAlbum({
    super.key,
    required this.blogName,
    required this.postPath,
    required this.date,
    required this.category,
  });

  @override
  State<WrappedAlbum> createState() => _WrappedAlbumState();
}

class _WrappedAlbumState extends State<WrappedAlbum> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getImagesFromFolder("assets/posts/${widget.postPath}/cover/"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Album(
            blogName: widget.blogName,
            postPath: widget.postPath,
            imagePath: snapshot.data!,
            date: widget.date,
            category: widget.category,
          );
        } else if (snapshot.hasError) {
          return Text(
              'Error loading images from assets/assets/posts/${widget.postPath}/cover/');
        }
        return Container(); // Show loading indicator
      },
    );
  }
}

Future<String> getImagesFromFolder(String path) async {
  // gets all the images from the path
  // uses the AssetManifest.json to get the paths
  // add more file types here if needed
  final manifestContent =
      await rootBundle.loadString('../../assets/AssetManifest.json');

  final Map<String, dynamic> manifestMap = json.decode(manifestContent);
  // >> To get paths you need these 2 lines ^

  final imagePath = manifestMap.keys
      .where((String key) => key.contains(path))
      .where((String key) => key.contains('.jpeg'))
      .toList();

  return imagePath[0];
}

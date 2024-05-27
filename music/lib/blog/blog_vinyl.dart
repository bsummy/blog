import 'package:flutter/material.dart';
import 'package:music/album/vinyl.dart';
import 'package:music/blog/blog_display.dart';

class BlogVinyl extends StatefulWidget {
  final Vinyl? vinyl;


  const BlogVinyl(
      {super.key,
      required this.vinyl});

  @override
  _BlogVinylState createState() => _BlogVinylState();
}

class _BlogVinylState extends State<BlogVinyl> {
  // wrapper class to accept a vinyl object and output a blog display
  // might just be easier to wrap into a blog display widget
  @override
  Widget build(BuildContext context) {
    return BlogDisplay(postPath: widget.vinyl!.postPath, blogName: widget.vinyl!.blogName, date: widget.vinyl!.date);
  }
}

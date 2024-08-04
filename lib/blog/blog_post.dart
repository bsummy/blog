import 'package:flutter/material.dart';
import 'package:music/album/vinyl.dart';
import 'package:music/blog/narrow_blog_post.dart';
import 'package:music/blog/wide_blog_post.dart';

class BlogPost extends StatelessWidget {
  final String markdown;
  final Vinyl vinyl;
  const BlogPost({
    super.key,
    required this.markdown,
    required this.vinyl,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        return NarrowBlogPost(
          markdown: markdown,
          vinyl: vinyl,
        );
      } else {
        return WideBlogPost(
          markdown: markdown,
          vinyl: vinyl,
        );
      }
    });
  }
}

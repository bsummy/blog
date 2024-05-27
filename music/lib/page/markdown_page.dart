import 'package:flutter/material.dart';
import 'package:music/misc/nav_bar.dart';
import 'package:music/blog/blog_display.dart';

class MarkdownPage extends StatelessWidget {
  final String postPath;
  final String blogName;
  final String date;

  const MarkdownPage({
    super.key,
    required this.postPath,
    required this.blogName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: NavBar(),
      ),
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return BlogDisplay(
                postPath: "blog1", // when there's more blogs, need to move this up the tree
                blogName: blogName,
                date: date,
              );
            },
          );
        },
      ),
    );
  }
}

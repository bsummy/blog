import 'package:flutter/material.dart';
import 'package:music/misc/nav_bar.dart';
import 'package:music/blog/blog_display.dart';



class MarkdownPage extends StatelessWidget {

  const MarkdownPage({super.key});

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
                return const BlogDisplay(
                            markdownFilePath: "../assets/markdown/blog1.MD",
                            title: "Blog Post 1",
                            date: "2024-05-25",
                          );
              },
            );
          },
        ),
      );




    }
}

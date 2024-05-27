import 'package:flutter/material.dart';
import 'package:music/misc/nav_button.dart';
import 'package:music/page/markdown_page.dart';
import 'package:music/page/home_page.dart';
import 'package:music/page/about_page.dart';


class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.pinkAccent,
      child:  const Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NavButton(name: "Home", route: HomePage()),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NavButton(name: "About", route: AboutPage()),
              NavButton(name: "Blog", route: MarkdownPage(blogName: "Blog #1", date: "2024-05-25", markdownFilePath: "blog1")),
                 ],
          ),
        ],
      ),
    );
  }
}

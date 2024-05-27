import 'package:flutter/material.dart';
import 'package:music/misc/nav_button.dart';
import 'package:music/page/home_page.dart';
import 'package:music/page/about_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.pinkAccent,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavButton(name: "Home", route: HomePage()),
            Text( // need a real title here
            "Bennett",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
          NavButton(name: "About", route: AboutPage()), // gotta redo this
        ],
      ),
    );
  }
}

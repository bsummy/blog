import 'package:flutter/material.dart';
import 'package:music/misc/nav_button.dart';

class NavBar extends StatelessWidget {
  final Function(String routeName) onNavigationTap;
  final bool isHomePage;

  const NavBar(
      {super.key, required this.onNavigationTap, required this.isHomePage});

  void _handleAboutTap() {
    onNavigationTap('/about'); // Example function for About route
  }

  void _handleHomeTap() {
    onNavigationTap('/'); // Example function for Home route
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.pinkAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              // need a real title here
              "Blog Name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              NavButton(name: "Home", function: _handleHomeTap),
              NavButton(name: "About", function: _handleAboutTap),
              IconButton(
                icon: const Icon(Icons.question_mark_sharp),
                color: Colors.white,
                tooltip: 'Press for Directions',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'On the home page: 1) tap on an album to get a vinyl 2) drag the vinyl to the turntable 3) press play to display blog posts.')));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

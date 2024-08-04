import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:music/page/home_page.dart';
import 'package:music/page/about_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs (Home, Directions, About Me)
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: const Color.fromARGB(255, 83, 198, 114),
            child: const TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.white, width: 4.0),
              ),
              labelColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black,
              physics: BouncingScrollPhysics(),
              dragStartBehavior: DragStartBehavior.start,
              tabs: [
                Tab(
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.house_sharp),
                      SizedBox(width: 8), // Add spacing between icon and text
                      Text('Home'),
                    ],
                  ),
                ),
                Tab(
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.info_sharp),
                      SizedBox(width: 8), // Add spacing between icon and text
                      Text('About Me'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            HomePage(),
            AboutPage(),
          ],
        ),
      ),
    );
  }
}


/*
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
                    duration: Duration(seconds: 10),
                      content: Text(
                          'On the home page: 1) tap on an album to get a vinyl 2) drag the vinyl to the turntable 3) press play to display blog post')));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/

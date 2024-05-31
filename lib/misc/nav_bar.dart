import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music/page/home_page.dart';
import 'package:music/page/about_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs (Home and About)
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Colors.pinkAccent,
            child: const TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.white, width: 4.0),
              ),
              labelColor: Colors.white, // pink text color
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black, // white text color
              tabs: [
                Tab(
                  icon: Row(
                    mainAxisSize: MainAxisSize.min, // Minimum size for the row
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
              onTap: onTabTap,
            ),
          ),

        ),
        body: const TabBarView(
          children: [
            // Content for Home tab (replace with your widget)
            HomePage(),
            // Content for About tab (replace with your widget)
            AboutPage(),
          ],
        ),

      ),
    );
  }
}

void onTabTap(int index) {
  // Handle tab tap
  switch (index) {
    case 0:
      // Home tab
      break;
    case 1:
      // About tab
      break;
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

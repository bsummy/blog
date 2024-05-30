import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(String routeName) onNavigationTap;

  const NavBar({super.key, required this.onNavigationTap});

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _handleHomeTap();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 239, 90, 140),
                shadowColor: Colors.red,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text("Home"),
            ),
          ),
          const Text(
            // need a real title here
            "Bennett",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding( // TODO: move to the nav button page
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _handleAboutTap();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 239, 90, 140),
                shadowColor: Colors.red,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text("About"),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../misc/nav_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: NavBar(),
        ),
      body: Center(
        child: Text(
          'This is the about page.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

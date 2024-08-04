import 'package:flutter/material.dart';
import 'narrow_home_page.dart';
import 'wide_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder:
      (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return const NarrowHomePage();
        } else {
          return const WideHomePage();
        }
      }
    );
  }
}

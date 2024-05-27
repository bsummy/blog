import 'package:flutter/material.dart';

import 'state/disk_state.dart';
import 'package:provider/provider.dart';
import 'state/playback_state.dart';
import 'page/home_page.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PlaybackState>(create: (_) => PlaybackState()),
        ChangeNotifierProvider<DiskState>(create: (_) => DiskState()),
      ],
      child: const MyApp(), // Your app's root widget
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

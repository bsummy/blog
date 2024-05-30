import 'package:flutter/material.dart';

import 'state/disk_state.dart';
import 'package:provider/provider.dart';
import 'state/playback_state.dart';
import 'page/home_page.dart';
import 'page/about_page.dart';
import 'misc/nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // to run locally, need these two lines commented out
  // ---
  // WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // ---

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
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: NavBar(
                onNavigationTap: (routeName) {
                  Navigator.pushNamed(context, routeName);
                },
              ),
            ),
            body: const HomePage(),
          );
        },
        '/about': (BuildContext context) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: NavBar(
                onNavigationTap: (routeName) {
                  Navigator.pushNamed(context, routeName);
                },
              ),
            ),
            body: const AboutPage(),
          );
        }
      },
    );
  }
}

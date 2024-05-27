import 'package:flutter/material.dart';


class TechnoScreen extends StatelessWidget {
  final String albumName;
  final String artistName;

  const TechnoScreen({
    super.key,
    required this.albumName,
    required this.artistName,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 100,
        height: 60,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              albumName,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'TechnoFont',
                color: Colors.white,
              ),
            ),
            Text(
              artistName,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'TechnoFont',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

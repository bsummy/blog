import 'package:flutter/material.dart';

class TechnoScreen extends StatelessWidget {
  final String text;

  const TechnoScreen({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 100,
        height: 40,
        color: Colors.grey[700],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'Overpass',
                fontSize: 24,
                color: Color.fromARGB(255, 83, 198, 114),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

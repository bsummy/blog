import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';

class Vinyl extends StatelessWidget {
  final Color color;
  final String blogName;
  final String date;

  const Vinyl(
      {super.key,
      required this.color,
      required this.blogName,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Stack(
          children: [
            Center(
              child: FractionallySizedBox(
                widthFactor: .95,
                heightFactor: .95,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[800] ??
                            Colors
                                .black, // Dark grey for a slight shadow effect
                        blurRadius: 2.0, // Adjust blur for desired depth
                        spreadRadius: 2.0, // Adjust spread for shadow size
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Stack(
                children: [
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      heightFactor: 0.5,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color,
                          ),
                          child: CircularText(
                            children: [
                              TextItem(
                                text: Text(
                                  blogName,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                space: 12,
                                startAngle: -90,
                                startAngleAlignment: StartAngleAlignment.center,
                                direction: CircularTextDirection.clockwise,
                              ),
                              TextItem(
                                text: Text(
                                  date,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                space: 6,
                                startAngle: 90,
                                startAngleAlignment: StartAngleAlignment.center,
                                direction: CircularTextDirection.anticlockwise,
                              ),
                            ],
                            radius: 125,
                            position: CircularTextPosition.inside,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.05,
                heightFactor: 0.05,
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';

class Record extends StatelessWidget {
  final Color color;

  final String albumName;
  final String artistName;

  const Record(
      {super.key,
      required this.color,
      required this.albumName,
      required this.artistName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[800] ??
                        Colors.black, // Dark grey for a slight shadow effect
                    blurRadius: 5.0, // Adjust blur for desired depth
                    spreadRadius: 2.0, // Adjust spread for shadow size
                  ),
                ],
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
                                  albumName,
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
                                  artistName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                space: 10,
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

class DraggableRecord extends StatelessWidget {
  final Color color;
  final String albumName;
  final String artistName;

  const DraggableRecord(
      {super.key,
      required this.color,
      required this.albumName,
      required this.artistName});

  @override
  Widget build(BuildContext context) {
    return Draggable<Record>(
      data: Record(color: color, albumName: albumName, artistName: artistName),
      feedback:
          Record(color: color, albumName: albumName, artistName: artistName),
      childWhenDragging: Container(),
      onDragEnd: (details) {
        // Handle drag end (optional)
      },
      child: Record(color: color, albumName: albumName, artistName: artistName),
    );
  }
}

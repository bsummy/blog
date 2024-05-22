import 'package:flutter/material.dart';
import 'package:music/record.dart';
import 'package:music/clipper.dart';

class Album extends StatefulWidget {
  final String albumName;
  final String imagePath;
  final String artistName;
  final Color color;

  const Album({
    super.key,
    required this.albumName,
    required this.imagePath,
    required this.artistName,
    required this.color,
  });

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> with TickerProviderStateMixin {
  bool _showRecord = false; // State variable for record visibility
  late AnimationController _recordController;

  late final Animation<double> _animatione = CurvedAnimation(
    parent: _recordController,
    curve: Curves.decelerate,
  );

  @override
  void initState() {
    super.initState();
    _recordController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _recordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap
        _toggleRecordVisibility();
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[800] ?? Colors.black,
                  blurRadius: .5,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Image.asset("../assets/albums/${widget.imagePath}.jpeg"),
          ),
          if (_showRecord)
          SizeTransition(
            sizeFactor: _animatione,
            axis: Axis.vertical,
            axisAlignment: -1,
            child: SlideTransition(
              position: TweenSequence<Offset>([
                TweenSequenceItem<Offset>(
                  tween: Tween<Offset>(
                    begin: const Offset(0, 0.0),
                    end: const Offset(0, -1),
                  ),
                  weight: 50,
                ),
                TweenSequenceItem<Offset>(
                  tween: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: const Offset(0, 0.0),
                  ),
                  weight: 50,
                )
              ]).animate(CurvedAnimation(
                parent: _recordController,
                curve: Curves.fastEaseInToSlowEaseOut,
              )),
              child: DraggableRecord(
                color: widget.color,
                albumName: widget.albumName,
                artistName: widget.artistName,
              ),
            ),
          ),

        ],
      ),
    );
  }

  // Function to toggle record visibility
  void _toggleRecordVisibility() {
    if (!_showRecord) {
      setState(() {
        _showRecord = true;
      });
      _recordController.forward();
    } else {
      _recordController.reverse().whenComplete(() {
        setState(() {
          _showRecord = false;
        });
      });
    }
  }
}

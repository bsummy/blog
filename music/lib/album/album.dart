import 'package:flutter/material.dart';
import 'package:music/album/draggable_record.dart';

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

  late AnimationController _forwardSlideController;

  int _topItemIndex = 1;

  @override
  void initState() {
    super.initState();
    _forwardSlideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _forwardSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<Offset> forwardSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -1.0),
    ).animate(CurvedAnimation(
      parent: _forwardSlideController,
      curve: Curves.fastOutSlowIn,
    ));

    final recordStackItem = SlideTransition(
      // slide transition that holds the record
      position: forwardSlideAnimation,
      child: DraggableRecord(
        color: widget.color,
        albumName: widget.albumName,
        artistName: widget.artistName,
      ),
    );

    final albumStackItem = Container(
      // container that holds the album cover
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
    );

    var stackChildren1 = [
      albumStackItem,
      if (_showRecord) recordStackItem,
    ];

    var stackChildren2 = [
      if (_showRecord) recordStackItem,
      albumStackItem,
    ];

    var stackChildren = stackChildren1;
    if (_topItemIndex == 0) {
      stackChildren = stackChildren1;
    } else {
      stackChildren = stackChildren2;
    }

    return GestureDetector(
      onTap: () {
        // Handle tap
        _toggleRecordVisibility();
      },
      child: Stack(
        children: stackChildren,
      ),
    );
  }

  void _bringToTop() {
    // selecting the top item
    setState(() {
      _topItemIndex = (_topItemIndex == 0) ? 1 : 0;
    });
  }

  // Function to toggle record visibility
  void _toggleRecordVisibility() {
    if (!_showRecord) {
      setState(() {
        // so records don't appear when page renders
        _showRecord = true;
      });
    }
      _forwardSlideController.forward().whenComplete(() {
        _bringToTop();
        _forwardSlideController.reverse();
      });

  }
}

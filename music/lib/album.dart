import 'package:flutter/material.dart';
import 'package:music/record.dart';

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
  bool _isSlidingForward = true; // State variable for slide direction

  late AnimationController _forwardSlideController;
  late AnimationController _backwardSlideController;

  var stackChildren;
  var stackChildren1;
  var stackChildren2;
  int _topItemIndex = 0;

  @override
  void initState() {
    super.initState();
    _forwardSlideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _backwardSlideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _forwardSlideController.dispose();
    _backwardSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<Offset> forwardSlideAnimation = Tween<Offset>(
      begin: Offset.zero,

      // Slide up from starting position

      end: const Offset(0, -1.0),
    ).animate(_forwardSlideController);

    final Animation<Offset> backwardSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.0), // Slide down from top
      end: Offset.zero,
    ).animate(_backwardSlideController);

    var stackChildren1 = [
      Container(
        key: const ValueKey("Album"),
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
        SlideTransition(
          key: const ValueKey("Record"),
          position: _isSlidingForward
              ? forwardSlideAnimation
              : backwardSlideAnimation,
          child: DraggableRecord(
            // grab the slide transition later
            color: widget.color,
            albumName: widget.albumName,
            artistName: widget.artistName,
          ),
        )

    ];

    var stackChildren2 = [
      if (_showRecord)
        SlideTransition(
          key: const ValueKey("Record"),
          position: _isSlidingForward
              ? forwardSlideAnimation
              : backwardSlideAnimation,
          child: DraggableRecord(
            // grab the slide transition later
            color: widget.color,
            albumName: widget.albumName,
            artistName: widget.artistName,
          ),
        ),
      Container(
        key: const ValueKey("Album"),
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
    ];

    if (_topItemIndex == 0) {
      stackChildren = stackChildren1;
    } else {
      stackChildren = stackChildren1;
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
    setState(() {
      _topItemIndex = (_topItemIndex == 0) ? 1 : 0;
    });
  }

  void _toggleSlideDirection() {
    setState(() {
      _isSlidingForward = !_isSlidingForward;

      if (_isSlidingForward) {
        _forwardSlideController.forward();
      } else {
        _backwardSlideController.forward();
      }
    });
  }

  // Function to toggle record visibility
  void _toggleRecordVisibility() {
    setState(() {
      _showRecord = true;
    });

    _forwardSlideController.forward();
    _backwardSlideController.forward().whenComplete(() {
      _bringToTop();
      _backwardSlideController.reset();
      _backwardSlideController.forward();
    });




    // setState(() {
    //   _showRecord = false;
    // });
  }
}

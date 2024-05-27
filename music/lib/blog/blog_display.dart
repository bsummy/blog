import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music/blog/blog_post.dart';

class BlogDisplay extends StatefulWidget {
  final String markdownFilePath;
  final String blogName;
  final String date;

  const BlogDisplay(
      {super.key,
      required this.markdownFilePath,
      required this.blogName,
      required this.date});

  @override
  _BlogDisplayState createState() => _BlogDisplayState();
}

class _BlogDisplayState extends State<BlogDisplay>
    with SingleTickerProviderStateMixin {
  Future<String> _fetchMarkdownFile() async {
    // put the blog number here
    final response = await http.get(
        Uri.parse("../assets/posts/${widget.markdownFilePath}/markdown.md"));

    return response.body;
  }

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _hasShownAnimation = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: const Offset(0.0, 0.0),
    ).animate(_animationController);

    _playSlideInAnimation(); // Play animation on initial build
  }

  void _playSlideInAnimation() {
    if (!_hasShownAnimation) {
      _animationController.forward().then((_) {
        _hasShownAnimation = true; // Mark animation as shown
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _fetchMarkdownFile(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SlideTransition(
            position: _slideAnimation,
            child: BlogPost(
                markdown: snapshot.data!,
                blogName: widget.blogName,
                date: widget.date,
                path: widget.markdownFilePath),
          );
        } else if (snapshot.hasError) {
          return const Text('Error loading Markdown file');
        } // if the snapshot is still loading
        return const Center(
          child: SizedBox(
              width: 50, height: 50, child: CircularProgressIndicator()),
        );
      },
    );
  }
}

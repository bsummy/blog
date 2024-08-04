import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music/album/vinyl.dart';
import 'blog_post.dart';

class BlogDisplay extends StatefulWidget {
  final Vinyl? vinyl;

  const BlogDisplay({
    super.key,
    required this.vinyl,
  });

  @override
  _BlogDisplayState createState() => _BlogDisplayState();
}

class _BlogDisplayState extends State<BlogDisplay>
    with SingleTickerProviderStateMixin {
  Future<String> _fetchMarkdownFile() async {
    final response = await http.get(
        Uri.parse("assets/assets/posts/${widget.vinyl!.postPath}/markdown.md"));

    return response.body;
  }

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastEaseInToSlowEaseOut,
    ));
    _playSlideInAnimation();
  }

  void _playSlideInAnimation() {
    _animationController.forward().then((_) => null); // Avoid setting a flag
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
            child: BlogPost(markdown: snapshot.data!, vinyl: widget.vinyl!),
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

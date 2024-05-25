import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music/blog/blog_post.dart';

class BlogDisplay extends StatefulWidget {
  final String markdownFilePath;
  final String title;
  final String date;

  const BlogDisplay({super.key, required this.markdownFilePath, required this.title, required this.date});

  @override
  _BlogDisplayState createState() => _BlogDisplayState();
}

class _BlogDisplayState extends State<BlogDisplay> {
  Future<String> _fetchMarkdownFile() async {
    final response = await http.get(Uri.parse(widget.markdownFilePath));
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _fetchMarkdownFile(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BlogPost(markdown: snapshot.data!, title: widget.title, date: widget.date);
        } else if (snapshot.hasError) {
          return const Text('Error loading Markdown file');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

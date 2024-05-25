import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class BlogPost extends StatelessWidget {
  final String markdown;
  final String title;
  final String date;

  const BlogPost(
      {super.key,
      required this.markdown,
      required this.title,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 600,
        height: 600,
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Pacifico-Regular',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: const Color.fromARGB(255, 253, 197, 93),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Markdown(data: markdown),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

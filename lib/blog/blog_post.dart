import 'package:flutter/material.dart';
import 'blog_carousel.dart';
import 'blog_markdown.dart';


class BlogPost extends StatelessWidget {
  final String markdown;
  final String blogName;
  final String date;
  final String path;
  const BlogPost(
      {super.key,
      required this.markdown,
      required this.blogName,
      required this.date,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 600,
            height: 1000,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        blogName,
                        style: const TextStyle(
                          fontFamily:
                              'Lora', // making lora my title font, but it doesn't really work
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 4.0),
                      color: const Color.fromARGB(255, 142, 181, 204),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: BlogMarkdown(markdown: markdown,),
                  ),
                ),
                const Expanded(
                  flex: 10,
                  child: BlogCarousel(
                    imagePaths: [
                      'blog1/photos/Image1.png',
                      'blog1/photos/Image2.png',
                      'blog1/photos/Image3.jpeg',
                      'blog1/photos/Image4.JPG',
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

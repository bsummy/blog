import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'blog_carousel.dart';

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
                    child: Markdown(
                      data: markdown,
                      // allows custom styling of the markdown
                      styleSheet: MarkdownStyleSheet(
                        p: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                        ),
                        h1: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 20,
                        ),
                        h2: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 18,
                        ),
                        h3: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                        ),
                        h4: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 14,
                        ),
                        h5: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 12,
                        ),
                        h6: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 10,
                        ),
                        blockquote: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                        ),
                        code: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                        ),
                        em: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                        ),
                        strong: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                        ),
                        del: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                        ),
                        listBullet: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                        ),
                        tableHead: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                        ),
                        tableBody: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                        ),
                        tableHeadAlign: TextAlign.center,
                        tableBorder: TableBorder.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        blockSpacing: 16,
                        listIndent: 16,
                        blockquotePadding: const EdgeInsets.all(16),
                        blockquoteDecoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        blockquoteAlign: WrapAlignment.start,
                      ),
                    ),
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    child: BlogMarkdown(
                      markdown: markdown,
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: FutureBuilder<List<String>>(
                    future: getImagesFromFolder("assets/posts/$path/photos/"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final imagePaths = snapshot.data!;
                        return BlogCarousel(
                          imagePaths: imagePaths,
                        );
                      } else if (snapshot.hasError) {
                        return const Text('Error loading images');
                      }
                      return const CircularProgressIndicator(); // Show loading indicator
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<List<String>> getImagesFromFolder(String path) async {
  // gets all the images from the path
  // uses the AssetManifest.json to get the paths
  // add more file types here if needed
  final manifestContent = await rootBundle
      .loadString('../../build/flutter_assets/AssetManifest.json');

  final Map<String, dynamic> manifestMap = json.decode(manifestContent);
  // >> To get paths you need these 2 lines ^

  final imagePaths = manifestMap.keys
      .where((String key) => key.contains(path))
      .where((String key) => key.contains('.jpeg'))
      .toList();

  return imagePaths;
}


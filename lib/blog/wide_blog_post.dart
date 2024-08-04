import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music/album/vinyl.dart';
import 'blog_carousel.dart';
import 'blog_markdown.dart';

class WideBlogPost extends StatelessWidget {
  final String markdown;
  final Vinyl vinyl;
  const WideBlogPost({
    super.key,
    required this.markdown,
    required this.vinyl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vinyl.blogName,
                style: const TextStyle(
                  fontFamily:
                      'Lora', // making lora my title font, but it doesn't really work
                  fontSize: 20,
                ),
              ),
              Text(
                vinyl.date,
                style: const TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4.0),
              color: lightenColor(vinyl.color, 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: BlogMarkdown(
              markdown: markdown,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: FutureBuilder<List<String>>(
            future:
                getImagesFromFolder("assets/posts/${vinyl.postPath}/photos/"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final imagePaths = snapshot.data!;
                return BlogCarousel(
                  imagePaths: imagePaths,
                );
              } else if (snapshot.hasError) {
                return Text('Error loading images from ${vinyl.postPath}');
              }
              return const CircularProgressIndicator(); // Show loading indicator
            },
          ),
        ),
      ],
    );
  }


Future<List<String>> getImagesFromFolder(String path) async {
  // gets all the images from the path
  // uses the AssetManifest.json to get the paths
  // add more file types here if needed
  final manifestContent =
      await rootBundle.loadString('../../assets/AssetManifest.json');

  final Map<String, dynamic> manifestMap = json.decode(manifestContent);
  // >> To get paths you need these 2 lines ^

// image paths have the shape
// ex assets/posts/blog1/photos/IMG_7631.jpeg
  final imagePaths = manifestMap.keys
      .where((String key) => key.contains(path))
      .where((String key) => key.contains('.jpeg'))
      .toList();

  return imagePaths;
}

Color lightenColor(Color color, double amount) {
  // lightening a color by 20% to make it more readable
  final hsl = HSLColor.fromColor(color);
  final lightness = (hsl.lightness + (amount * 0.1)).clamp(0.0, 1.0);
  return hsl.withLightness(lightness).toColor();
}




}

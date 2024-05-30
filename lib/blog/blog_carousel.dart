import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BlogCarousel extends StatelessWidget {
  final List<String> imagePaths;

  const BlogCarousel({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 500,
        autoPlay: true, // can turn this back on for prod
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1500),
        viewportFraction: 1, //doesn't look so good w/ diff picture sizes
      ),
      items: imagePaths
          .map((imagePath) => _buildCarouselItem(imagePath))
          .toList(),
    );
  }

  Widget _buildCarouselItem(String imagePath) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image(image: AssetImage(imagePath), fit: BoxFit.cover)),
    );
  }
}

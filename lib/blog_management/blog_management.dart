import 'package:flutter/material.dart';
import 'package:music/album/wrapped_album.dart';
import '../misc/album_shelf.dart';

class BlogManagement extends StatelessWidget {
  const BlogManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlbumShelf(albums: <WrappedAlbum>[
      WrappedAlbum(
        blogName: "Norden-Americans",
        postPath: 'blog11',
        date: '9-26-24',
        category: "Study Abroad",
      ),
      WrappedAlbum(
        blogName: "Kippis!",
        postPath: 'blog10',
        date: '8-30-24',
        category: "Finland",
      ),
      WrappedAlbum(
        blogName: "Proost!",
        postPath: 'blog9',
        date: '8-23-24',
        category: "Study Abroad",
      ),
      // WrappedAlbum(
      //   blogName: "Montreal Potato Chowder",
      //   postPath: 'blog8',
      //   date: '8-5-24',
      //   category: "Cooking",
      // ),
      WrappedAlbum(
        blogName: "Bando Stone",
        postPath: 'blog7',
        date: '8-3-24',
        category: "Music",
      ),
      // WrappedAlbum(
      //   blogName: "Settling In",
      //   postPath: 'blog6',
      //   date: '6-28-24',
      //   category: "Boston",
      // ),
      WrappedAlbum(
        blogName: 'On The Road Again',
        postPath: 'blog5',
        date: '6-9-24',
        category: "Montreal",
      ),
      WrappedAlbum(
        blogName: "Homer's Odyssey",
        postPath: 'blog4',
        date: '5-6-24',
        category: "Introduction",
      ),
      WrappedAlbum(
        blogName: 'Wrigley is Better Anyway',
        postPath: 'blog3',
        date: '6-2-24',
        category: "Boston",
      ),
      WrappedAlbum(
        blogName: 'Tech Talk',
        postPath: 'blog2',
        date: '5-30-24',
        category: "Software Engineering",
      ),
      WrappedAlbum(
        blogName: "Let's Start Here",
        postPath: 'blog1',
        date: '5-27-24',
        category: "Introduction",
      ),
    ]);
  }
}

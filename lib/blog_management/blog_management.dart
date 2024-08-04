import 'package:flutter/material.dart';
import 'package:music/album/wrapped_album.dart';
import '../misc/album_shelf.dart';

class BlogManagement extends StatelessWidget {
  const BlogManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlbumShelf(albums: <WrappedAlbum>[
      WrappedAlbum(
        blogName: "Let's Start Here",
        postPath: 'blog1',
        date: '05-27-24',
        color: Colors.blueGrey,
      ),
      WrappedAlbum(
        blogName: 'Tech Talk',
        postPath: 'blog2',
        date: '05-30-24',
        color: Colors.green,
      ),
      WrappedAlbum(
        blogName: 'Wrigley is Better Anyway',
        postPath: 'blog3',
        date: '06-02-24',
        color: Color.fromARGB(255, 219, 53, 38),
      ),
      WrappedAlbum(
        blogName: "Homer's Odyssey",
        postPath: 'blog4',
        date: '05-06-24',
        color: Color.fromARGB(255, 155, 157, 244),
      ),
      WrappedAlbum(
        blogName: 'On The Road Again',
        postPath: 'blog5',
        date: '06-09-24',
        color: Color.fromARGB(255, 253, 118, 228),
      ),
      WrappedAlbum(
        blogName: "Settling In",
        postPath: 'blog6',
        date: '06-28-24',
        color: Color.fromARGB(255, 118, 252, 178),
      ),
      WrappedAlbum(
        blogName: "Bando Stone",
        postPath: 'blog7',
        date: '08-03-24',
        color: Colors.blue,
      ),
      // WrappedAlbum(
      //   blogName: "Coloring Book",
      //   postPath: 'blog8',
      //   date: '05-28-24',
      //   color: Colors.pink,
      // ),
      // WrappedAlbum(
      //   blogName: "Care For Me",
      //   postPath: 'blog9',
      //   date: '05-28-24',
      //   color: Colors.grey,
      // ),
    ]);
  }
}

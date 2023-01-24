import 'package:flutter/material.dart';
import 'data/movie.dart';
import 'end_point.dart';
import 'movie_preview_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Movie>>(
          future: getAllTopRatedMovies(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final movieList = snapshot.data ?? [];

            return ListView.separated(
              itemCount: movieList.length,
              itemBuilder: (context, index) =>
                  MoviePreviewTile(movie: movieList[index]),
              separatorBuilder: (context, index) => const Divider(),
            );
          }),
    );
  }
}


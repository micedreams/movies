import 'package:flutter/material.dart';
import 'package:movies/end_point.dart';
import 'data/movie.dart';

class MovieDetailsConfig {
  const MovieDetailsConfig({required this.movie});

  final Movie movie;
}

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key, required this.config});
  static const routeName = '/MovieDetailsPage';

  final MovieDetailsConfig config;

  @override
  State createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final movie = widget.config.movie;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(movie.title ?? ''),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  '$baseImageUrl${movie.poster_path}',
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movie.overview ?? '',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rating: ${movie.vote_average ?? 0.0}'),
                      Text('Release: ${movie.release_date ?? ''}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

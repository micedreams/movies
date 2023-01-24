import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/end_point.dart';
import 'data/movie.dart';

class MovieDetailsConfig {
  const MovieDetailsConfig({
    required this.movie,
    required this.uniqueKey,
  });

  final Movie movie;
  final UniqueKey uniqueKey;
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
                CachedNetworkImage(
                  key: widget.config.uniqueKey,
                  imageUrl: '$baseImageUrl${movie.poster_path}',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movie.overview ?? '',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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

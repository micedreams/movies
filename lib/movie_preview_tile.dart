import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'data/movie.dart';
import 'end_point.dart';
import 'movie_details_screen.dart';

class MoviePreviewTile extends StatelessWidget {
  const MoviePreviewTile({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final uniqueKey = UniqueKey();
    return ListTile(
        onTap: () {
          Navigator.pushNamed(context, MovieDetailsPage.routeName,
              arguments: MovieDetailsConfig(movie: movie, uniqueKey: uniqueKey));
        },
        leading: CachedNetworkImage(
          key: uniqueKey,
          imageUrl: '$baseImageUrl${movie.poster_path}',
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(movie.title ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rating: ${movie.vote_average ?? 0.0}'),
            Text('Release: ${movie.release_date ?? ''}'),
          ],
        ),
      );
  }
}

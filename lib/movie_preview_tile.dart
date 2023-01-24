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
  Widget build(BuildContext context) => ListTile(
        onTap: () {
          Navigator.pushNamed(context, MovieDetailsPage.routeName,
              arguments: MovieDetailsConfig(movie: movie));
        },
        leading: Image.network(
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

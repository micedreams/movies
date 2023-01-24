import 'package:flutter/material.dart';
import 'data/movie.dart';
import 'end_point.dart';
import 'movie_details_screen.dart';

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
              arguments: MovieDetailsConfig(title: movie.title ?? ''));
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
        subtitle: Text(
          "Rating: ${movie.vote_average ?? 0.0}",
        ),
      );
}

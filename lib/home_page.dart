import 'package:flutter/material.dart';
import 'data/movie.dart';
import 'end_point.dart';

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
              itemBuilder: (context, index) => ListTile(
                leading: Image.network(
                  'http://image.tmdb.org/t/p/w500${movieList[index].poster_path}',
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
                title: Text(movieList[index].title ?? ''),
                subtitle: Text(
                  "Rating: ${movieList[index].vote_average ?? 0.0}",
                ),
              ),
              separatorBuilder: (context, index) => const Divider(),
            );
          }),
    );
  }
}

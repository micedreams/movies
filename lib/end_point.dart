import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/data/movie.dart';

import 'db_provider.dart';

const baseApiUrl = 'api.themoviedb.org';
const baseImageUrl = 'http://image.tmdb.org/t/p/w500';
const apiKey = '7793f07518f4df0682c6c7d5657e9a5a';

Future<List<Movie>> getAllTopRatedMoviesFromDB() async {
  final movieList = await DBProvider.db.getAllMovies();

  if (movieList.isEmpty) {
    await getAllTopRatedMovies();
  }

  return movieList;
}

Future<List<Movie>> getAllTopRatedMovies({bool onRefresh = false}) async {
  final movieList = <Movie>[];

  final url = Uri.https(baseApiUrl, '3/movie/top_rated', {'api_key': apiKey});

  final response = await http.get(url);
  final responsejson = jsonDecode(response.body);
  final results = responsejson['results'];

  for (var result in results) {
    movieList.add(Movie.fromJson(result));

    await DBProvider.db.createMovie(
      Movie.fromJson(result),
      onRefresh: onRefresh,
    );
  }

  return movieList;
}

Future getMovieDetails(String id) async {
  var url = Uri.https(baseApiUrl, '3/movie/$id', {'api_key': apiKey});

  final response = await http.get(url);

  return response;
}

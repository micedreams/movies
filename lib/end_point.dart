import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/data/movie.dart';

const baseApiUrl = 'api.themoviedb.org';
const baseImageUrl = 'http://image.tmdb.org/t/p/w500';
const apiKey = '7793f07518f4df0682c6c7d5657e9a5a';

Future<List<Movie>> getAllTopRatedMovies() async {
  final url = Uri.https(baseApiUrl, '3/movie/top_rated', {'api_key': apiKey});

  final response = await http.get(url);
  final responsejson = jsonDecode(response.body);
  final results = responsejson['results'];
  final movieList = <Movie>[];

  for (var result in results) {
    movieList.add(Movie.fromJson(result));
  }

  return movieList;
}

Future getMovieDetails(String id) async {
  final charactersPath = '3/movie/$id';
  const baseUrl = 'api.themoviedb.org';
  final queryParameters = <String, String>{
    'api_key': '7793f07518f4df0682c6c7d5657e9a5a',
  };

  var url = Uri.https(baseUrl, charactersPath, queryParameters);

  final response = await http.get(url);

  return response;
}

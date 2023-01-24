import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future getAllTopRatedMovies() async {
  const charactersPath = '3/movie/top_rated';
  const baseUrl = 'api.themoviedb.org';
  final queryParameters = <String, String>{
    'api_key': '7793f07518f4df0682c6c7d5657e9a5a',
  };

  var url = Uri.https(baseUrl, charactersPath, queryParameters);

  final response = await http.get(url);

  return response;
}

Future getMovieDetails(String id) async {
  final charactersPath = '3/movie/$id';
  const baseUrl = 'api.themoviedb.org';
  final queryParameters = <String, String>{
    'api_key': '7793f07518f4df0682c6c7d5657e9a5a',
  };

  var url = Uri.https(baseUrl, charactersPath, queryParameters);

   print(url);



  final response = await http.get(url);

  print(response.body);

  return response;
}

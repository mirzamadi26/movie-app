import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieService with ChangeNotifier {
  static const apiKey = 'a46bc5f1e7e1e91f4d7857c33e67079f';
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const popularMoviesUrl = '$baseUrl/movie/popular';

  Future<List<Movie>> getPopularMovies() async {
    final response =
        await http.get(Uri.parse('$popularMoviesUrl?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Movie.fromJsonList(data['results']);
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    final response = await http.get(Uri.parse(
      '$baseUrl/movie/$movieId?api_key=$apiKey',
    ));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}

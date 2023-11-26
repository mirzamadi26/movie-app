import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/api_service.dart';
import 'package:movie_app/view/components/favorite_icon.dart';
import 'package:movie_app/view/components/movie_card.dart';
import 'package:movie_app/widgets/text.dart';

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final MovieService tmdbService = MovieService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: modified_text(text: "Popular Movies"),
      ),
      body: FutureBuilder(
        future: tmdbService.getPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
                  Lottie.asset('assets/lottie.json', width: 200, height: 200),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final List<Movie> movies = snapshot.data as List<Movie>;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieCardWidget(
                  id: movie.id,
                  posterUrl: movie.posterUrl,
                  title: movie.title,
                  releaseDate: movie.releaseDate,
                  overview: movie.overview,
                  show: true,
                );
              },
            );
          }
        },
      ),
    );
  }
}

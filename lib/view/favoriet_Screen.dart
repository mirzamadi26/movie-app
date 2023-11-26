import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/serviice/api_service.dart';
import 'package:movie_app/serviice/shared_preferences.dart';
import 'package:movie_app/view/components/movie_card.dart';
import 'package:movie_app/widgets/text.dart';

class FavoriteMoviesScreen extends StatefulWidget {
  @override
  _FavoriteMoviesScreenState createState() => _FavoriteMoviesScreenState();
}

class _FavoriteMoviesScreenState extends State<FavoriteMoviesScreen> {
  final MovieService tmdbService = MovieService();
  Future<List<Map<String, dynamic>>>? favoriteMoviesFuture;

  @override
  void initState() {
    super.initState();
    favoriteMoviesFuture = getFavoriteMovies();
  }

  Future<List<Map<String, dynamic>>> getFavoriteMovies() async {
    final List<int> favoriteMovieIds = await FavoriteMovies.getFavorites();
    final List<Future<Map<String, dynamic>>> futures = favoriteMovieIds
        .map((int movieId) => tmdbService.getMovieDetails(movieId))
        .toList();

    return Future.wait(futures);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: modified_text(text: 'Favorite Movies'),
        ),
        body: FutureBuilder(
            future: favoriteMoviesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Lottie.asset('assets/lottie.json',
                      width: 200, height: 200),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final List<Map<String, dynamic>>? favoriteMovies =
                    snapshot.data;
                return ListView.builder(
                  itemCount: favoriteMovies!.length,
                  itemBuilder: (context, index) {
                    final Map<String, dynamic> movie = favoriteMovies[index];
                    return MovieCardWidget(
                        id: movie['id'],
                        posterUrl:
                            'https://image.tmdb.org/t/p/w300${movie['poster_path']}',
                        title: movie['title'],
                        releaseDate: movie['release_date'],
                        overview: movie['overview']);
                  },
                );
              }
            }));
  }
}

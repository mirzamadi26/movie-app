import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  List<int> _favoriteMovieIds = [];
  List<int> get favoriteMovieIds => _favoriteMovieIds;

  void toggleFavorite(int movieId) {
    if (_favoriteMovieIds.contains(movieId)) {
      _favoriteMovieIds.remove(movieId);
    } else {
      _favoriteMovieIds.add(movieId);
    }
    notifyListeners();
  }

  bool isMovieFavorite(int movieId) {
    return _favoriteMovieIds.contains(movieId);
  }
}

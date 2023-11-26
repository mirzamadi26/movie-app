import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteMovies {
  static const _key = 'favorite_movies';

  static Future<List<int>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesString = prefs.getString(_key) ?? '[]';
    final List<dynamic> favoritesList = json.decode(favoritesString);
    return List<int>.from(favoritesList);
  }

  static Future<void> toggleFavorite(int movieId) async {
    final List<int> favorites = await getFavorites();
    if (favorites.contains(movieId)) {
      favorites.remove(movieId);
    } else {
      favorites.add(movieId);
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, json.encode(favorites));
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/serviice/shared_preferences.dart';

class FavoriteIcon extends StatefulWidget {
  final int movieId;

  FavoriteIcon({required this.movieId});

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    FavoriteMovies.getFavorites().then((favorites) {
      setState(() {
        isFavorite = favorites.contains(widget.movieId);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        FavoriteMovies.toggleFavorite(widget.movieId);
      },
    );
  }
}

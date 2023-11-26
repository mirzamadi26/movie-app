class Movie {
  final int id;
  final String title;
  final String posterUrl;
  final String releaseDate;
  final String overview;
  final bool isFavorite;

  Movie({
    required this.id,
    required this.posterUrl,
    required this.releaseDate,
    required this.overview,
    required this.title,
    required this.isFavorite,
  });

  static List<Movie> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Movie.fromJson(json)).toList();
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'] ?? '',
      releaseDate: json['release_date'] ?? '',
      overview: json['overview'] ?? '',
      posterUrl: 'https://image.tmdb.org/t/p/w300${json['poster_path'] ?? ''}',
      isFavorite: false,
    );
  }
}

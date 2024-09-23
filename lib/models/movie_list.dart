class MovieList {
  final String id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      voteAverage,
      voteCount;

  MovieList(
      {required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.voteCount});

  factory MovieList.fromJson(dynamic json) {
    return MovieList(
      id: json["id"].toString(),
      originalLanguage: json["original_language"], // Fix here
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"].toString(),
      posterPath: json["poster_path"],
      releaseDate: json["release_date"].toString(),
      title: json["title"],
      voteAverage: json["vote_average"].toString(),
      voteCount: json["vote_count"].toString(),
    );
  }

  static List<MovieList> movieListFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      if (data is Map<String, dynamic>) {
        return MovieList.fromJson(data);
      } else {
        throw Exception('Invalid data type');
      }
    }).toList();
  }
}

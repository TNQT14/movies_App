import 'package:equatable/equatable.dart';

class MoviesSimilar extends Equatable {
  final int id;
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final List<int> genreIds;
  final String? backdropPath;
  final String? posterPath;
  final bool adult;

  const MoviesSimilar({
    required this.overview,
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.genreIds,
    this.backdropPath,
    required this.releaseDate,
    this.posterPath,
    required this.adult,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    backdropPath,
    overview,
    genreIds,
    posterPath,
    adult,
    releaseDate,
  ];
}

class MoviesSimilarModel extends MoviesSimilar {
  const MoviesSimilarModel(
      {required super.overview,
        required super.id,
        required super.title,
        required super.voteAverage,
        required super.genreIds,
        super.backdropPath,
        required super.releaseDate,
        super.posterPath,
        required super.adult});

  factory MoviesSimilarModel.fromJson(Map<String, dynamic> json) {
    return MoviesSimilarModel(
      overview: json["description"],
      id: json["show_id"],
      title: json["title"],
      voteAverage: json["vote_average"].toDouble(),
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      backdropPath: json["backdrop_path"] ?? '',
      releaseDate: json["release_date"],
      posterPath: json["poster_path"] ?? '',
      adult: json['adult'],
    );
  }
}

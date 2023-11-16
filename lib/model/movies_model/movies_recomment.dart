import 'package:equatable/equatable.dart';

class MoviesRecommendation extends Equatable {
  final int id;
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  // final List<int> genreIds;
  final String? backdropPath;
  final String? posterPath;
  // final bool adult;

  const MoviesRecommendation({
    required this.overview,
    required this.id,
    required this.title,
    required this.voteAverage,
    // required this.genreIds,
    this.backdropPath,
    required this.releaseDate,
    this.posterPath,
    // required this.adult,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    backdropPath,
    overview,
    // genreIds,
    posterPath,
    // adult,
    releaseDate,
  ];
}

class MoviesRecommendationModel extends MoviesRecommendation {
  const MoviesRecommendationModel(
      {required super.overview,
        required super.id,
        required super.title,
        required super.voteAverage,
        // required super.genreIds,
        super.backdropPath,
        required super.releaseDate,
        super.posterPath,
        // required super.adult
      });

  factory MoviesRecommendationModel.fromJson(Map<String, dynamic> json) {
    return MoviesRecommendationModel(
      overview: json["description"],
      id: json["show_id"],
      title: json["title"],
      voteAverage: json["weight"]?.toDouble() ?? 0.0,
      // genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      backdropPath: json["backdrop_path"] ?? '',
      releaseDate: json["date_added"],
      posterPath: json["poster_path"] ?? '',
      // adult: json['adult'],


    );
  }
}


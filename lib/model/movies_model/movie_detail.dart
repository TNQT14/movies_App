import 'package:equatable/equatable.dart';
import 'package:movies_app/model/movies_model/review.dart';
import 'cast.dart';
import 'genres.dart';

class MovieDetails extends Equatable {
  final int? id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final int runtime;
  final List<Genres> genres;
  final bool adult;
  final String trailerUrl;
  final List<Cast>? cast;
  final List<Review>? reviews;
  final bool isAdded;

  const MovieDetails({
    required this.overview,
    this.id,
    required this.title,
    required this.voteAverage,
    required this.genres,
    required this.backdropPath,
    required this.releaseDate,
    required this.posterPath,
    required this.adult,
    required this.runtime,
    required this.trailerUrl,
    this.cast,
    this.reviews,
    this.isAdded = false,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    backdropPath,
    overview,
    genres,
    posterPath,
    adult,
    releaseDate,
    runtime,
    trailerUrl,
    isAdded,
  ];
}

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.overview,
    required super.id,
    required super.title,
    required super.voteAverage,
    required super.backdropPath,
    required super.releaseDate,
    required super.posterPath,
    required super.adult,
    required super.genres,
    required super.runtime,
    required super.trailerUrl,
    required super.cast,
    required super.reviews,
  });

  factory MovieDetailsModel.fromMediaDetails(MovieDetails movieDetails) {
    return MovieDetailsModel(
      id: movieDetails.id,
      title: movieDetails.title,
      posterPath: movieDetails.posterPath,
      backdropPath: movieDetails.backdropPath,
      voteAverage: movieDetails.voteAverage,
      releaseDate: movieDetails.releaseDate,
      overview: movieDetails.overview,
      adult: movieDetails.adult,
      genres: movieDetails.genres,
      runtime: movieDetails.runtime,
      trailerUrl: movieDetails.trailerUrl,
      cast: movieDetails.cast,
      reviews: movieDetails.reviews,
    );
  }

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      overview: json["overview"],
      id: json["id"],
      title: json["title"],
      voteAverage: json["vote_average"].toDouble(),
      backdropPath: json["backdrop_path"] ?? '',
      releaseDate: json["release_date"],
      posterPath: json["poster_path"] ?? '',
      adult: json['adult'],
      genres: List<GenresModel>.from(
          json["genres"].map((e) => GenresModel.fromJson(e))),
      runtime: json["runtime"],
      trailerUrl: getTrailerUrl(json),
      cast: List<CastModel>.from(
          (json['credits']['cast'] as List).map((e) => CastModel.fromJson(e))),
      reviews: List<ReviewModel>.from((json['reviews']['results'] as List)
          .map((e) => ReviewModel.fromJson(e))),
    );
  }
}


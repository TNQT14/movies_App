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

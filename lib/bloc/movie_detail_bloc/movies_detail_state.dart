import 'package:equatable/equatable.dart';
import '../../model/movies_model/movie_detail.dart';
import '../../model/movies_model/movies_recomment.dart';
import '../../model/movies_model/movies_similar.dart';
import '../../utils/enum.dart';

class MoviesDetailsStates extends Equatable {
  final MovieDetails? moviesDetails;
  final RequestState moviesDetailsStates;
  final String moviesDetailsMessage;

  final List<MoviesRecommendation> moviesRecommendation;
  final RequestState moviesRecommendationStates;
  final String moviesRecommendationMessage;

  final List<MoviesSimilar> moviesSimilar;
  final RequestState moviesSimilarStates;
  final String moviesSimilarMessage;

  const MoviesDetailsStates({
    this.moviesDetails,
    this.moviesDetailsStates = RequestState.loading,
    this.moviesDetailsMessage = "",
    this.moviesRecommendation = const [],
    this.moviesRecommendationStates = RequestState.loading,
    this.moviesRecommendationMessage = "",
    this.moviesSimilar = const [],
    this.moviesSimilarStates = RequestState.loading,
    this.moviesSimilarMessage = "",
  });

  MoviesDetailsStates copyWith({
    MovieDetails? moviesDetails,
    RequestState? moviesDetailsStates,
    String? moviesDetailsMessage,
    List<MoviesRecommendation>? moviesRecommendation,
    RequestState? moviesRecommendationStates,
    String? moviesRecommendationMessage,
    List<MoviesSimilar>? moviesSimilar,
    RequestState? moviesSimilarStates,
    String? moviesSimilarMessage,
  }) {
    return MoviesDetailsStates(
      moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
      moviesDetails: moviesDetails ?? this.moviesDetails,
      moviesDetailsStates: moviesDetailsStates ?? this.moviesDetailsStates,
      moviesRecommendation: moviesRecommendation ?? this.moviesRecommendation,
      moviesRecommendationStates:
      moviesRecommendationStates ?? this.moviesRecommendationStates,
      moviesRecommendationMessage:
      moviesRecommendationMessage ?? this.moviesRecommendationMessage,
      moviesSimilar: moviesSimilar ?? this.moviesSimilar,
      moviesSimilarStates: moviesSimilarStates ?? this.moviesSimilarStates,
      moviesSimilarMessage: moviesSimilarMessage ?? this.moviesSimilarMessage,
    );
  }

  @override
  List<Object?> get props => [
    moviesDetails,
    moviesDetailsMessage,
    moviesDetailsStates,
    moviesRecommendation,
    moviesRecommendationMessage,
    moviesRecommendationStates,
    moviesSimilar,
    moviesSimilarMessage,
    moviesSimilarStates,
  ];
}

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../usecase/movies/get_movie_details_use_case.dart';
import '../../usecase/movies/get_movie_recommendation_usecase.dart';
import '../../utils/enum.dart';
import 'movie_detail_event.dart';
import 'movies_detail_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsStates> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationsUseCase;

  MoviesDetailsBloc(this.getMovieDetailsUseCase,
      this.getMovieRecommendationsUseCase,
      )
      : super(const MoviesDetailsStates()) {
    on<GetMoviesDetailsEvent>(_getMovieDetails);
    on<GetMoviesRecommendationEvent>(_getMovieRecommendations);
  }

  FutureOr<void> _getMovieDetails(
      GetMoviesDetailsEvent event, Emitter<MoviesDetailsStates> emit) async {
    final result = await getMovieDetailsUseCase(
        MovieDetailsParameters(movieID: event.movieID));
    result.fold(
            (l) => emit(state.copyWith(
            moviesDetailsStates: RequestState.error,
            moviesDetailsMessage: l.message)),
            (r) => emit(state.copyWith(
            moviesDetailsStates: RequestState.loaded, moviesDetails: r)));
  }

  FutureOr<void> _getMovieRecommendations(GetMoviesRecommendationEvent event,
      Emitter<MoviesDetailsStates> emit) async {
    final result = await getMovieRecommendationsUseCase(
        MovieRecommendationParameters(movieID: event.id));
    result.fold(
            (l) => emit(state.copyWith(
          moviesRecommendationStates: RequestState.error,
          moviesRecommendationMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          moviesRecommendationStates: RequestState.loaded,
          moviesRecommendation: r,
        )));
  }

}

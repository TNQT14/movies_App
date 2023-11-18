import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../usecase/base_use_case.dart';
import '../../usecase/movies/get_now_playing_movies_usecases.dart';
import '../../usecase/movies/get_upcoming_movies_use_case.dart';
import '../../utils/enum.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetUpcomingMoviesUseCase getUpcomingMoviesUseCase;
  MoviesBloc(
      this.getNowPlayingMoviesUseCase,
      this.getUpcomingMoviesUseCase,
      )
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetUpcomingMoviesEvent>(_getUpcomingMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    result.fold(
            (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
            (r) => emit(state.copyWith(
            nowPlayingState: RequestState.loaded, nowPlayingMovies: r)));
  }

  FutureOr<void> _getUpcomingMovies(
      GetUpcomingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getUpcomingMoviesUseCase(const NoParameters());

    result.fold(
            (l) => emit(state.copyWith(
            upcomingState: RequestState.error, upcomingMessage: l.message)),
            (r) => emit(state.copyWith(
            upcomingState: RequestState.loaded, upcomingMovies: r)));
  }

  int page = 1;

}

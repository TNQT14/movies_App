import 'package:get_it/get_it.dart';
import '../../bloc/main_bloc/main_bloc.dart';
import '../../bloc/movie_detail_bloc/movie_detail_bloc.dart';
import '../../bloc/movies_bloc/movies_bloc.dart';
import '../../usecase/movies/get_movie_details_use_case.dart';
import '../../usecase/movies/get_movie_recommendation_usecase.dart';
import '../../usecase/movies/get_now_playing_movies_usecases.dart';
import '../../usecase/movies/get_popular_movies_usecase.dart';
import '../../usecase/movies/get_upcoming_movies_use_case.dart';
import '../movies_repository/base_movies_remote_data_source.dart';
import '../movies_repository/base_movies_repository.dart';
import '../movies_repository/movies_repository.dart';
final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(() => MainBloc());
    sl.registerFactory(() => MoviesBloc(
      sl(),
      sl(),
    ));
    sl.registerFactory(() => MoviesDetailsBloc(sl(), sl()));

    sl.registerLazySingleton(
            () => GetNowPlayingMoviesUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
            () => GetUpcomingMoviesUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
            () => GetPopularMoviesUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
            () => GetMovieDetailsUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
            () => GetMovieRecommendationUseCase(baseMovieRepository: sl()));

    /// Movies Repository
    sl.registerLazySingleton<BaseMovieRepository>(
            () => MoviesRepository(baseMovieRemoteDataSource: sl()));

    /// Movies Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
            () => MovieRemoteDataSource());
  }
}

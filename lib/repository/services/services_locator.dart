import 'package:get_it/get_it.dart';

import '../../bloc/main_bloc/main_bloc.dart';
import '../../bloc/movie_detail_bloc/movie_detail_bloc.dart';
import '../../bloc/movies_bloc/movies_bloc.dart';
import '../../usecase/movies/get_all_popular_movies_use_case.dart';
import '../../usecase/movies/get_all_top_rated_movies_use_case.dart';
import '../../usecase/movies/get_movie_details_use_case.dart';
import '../../usecase/movies/get_movie_recommendation_usecase.dart';
import '../../usecase/movies/get_movies_similar_usecase.dart';
import '../../usecase/movies/get_now_playing_movies_usecases.dart';
import '../../usecase/movies/get_popular_movies_usecase.dart';
import '../../usecase/movies/get_top_rated_movies_uscase.dart';
import '../../usecase/movies/get_upcoming_movies_use_case.dart';
import '../movies_repository/base_movies_remote_data_source.dart';
import '../movies_repository/base_movies_repository.dart';
import '../movies_repository/movies_repository.dart';
final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Main Application
    sl.registerFactory(() => MainBloc());

    /// TVS =>
    /// TVS Bloc
    // sl.registerFactory(() => TvsBloc(sl(), sl(), sl(), sl()));
    // sl.registerFactory(() => TvsDetailsBloc(sl(), sl(), sl()));

    /// TVS Use Cases
    // sl.registerLazySingleton(
    //         () => GetOnTheAirTvsUseCase(baseTvRepository: sl()));
    // sl.registerLazySingleton(
    //         () => GetAiringTodayTvsUseCase(baseTvRepository: sl()));
    //
    // sl.registerLazySingleton(
    //         () => GetPopularTvsUseCase(baseTvRepository: sl()));
    // sl.registerLazySingleton(
    //         () => GetTopRatedTvsUseCase(baseTvRepository: sl()));
    // sl.registerLazySingleton(
    //         () => GetTvsDetailsUseCase(baseTvsRepository: sl()));
    //
    // sl.registerLazySingleton(
    //         () => GetTvRecommendationUseCase(baseTvRepository: sl()));
    // sl.registerLazySingleton(() => GetTvSimilarUseCase(baseTvRepository: sl()));
    //
    // /// TVS Repository
    // sl.registerLazySingleton<BaseTvRepository>(
    //         () => TvsRepository(baseTvRemoteDataSource: sl()));
    //
    // /// TVS Data Source
    // sl.registerLazySingleton<BaseTvRemoteDataSource>(
    //         () => TvRemoteDataSource());

    /// MOVIES =>
    /// Movies Bloc
    sl.registerFactory(() => MoviesBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ));
    sl.registerFactory(() => MoviesDetailsBloc(sl(), sl(), sl()));

    /// Movies Use Cases
    sl.registerLazySingleton(
            () => GetNowPlayingMoviesUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
            () => GetUpcomingMoviesUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
            () => GetPopularMoviesUseCase(baseMovieRepository: sl()));
    sl.registerLazySingleton(
            () => GetAllPopularMoviesUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
            () => GetMovieDetailsUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
            () => GetMovieRecommendationUseCase(baseMovieRepository: sl()));
    sl.registerLazySingleton(
            () => GetMovieSimilarUseCase(baseMovieRepository: sl()));
    sl.registerLazySingleton(
            () => GetTopRatedMoviesUseCase(baseMovieRepository: sl()));
    sl.registerLazySingleton(
            () => GetAllTopRatedMoviesUseCase(baseMovieRepository: sl()));

    /// Movies Repository
    sl.registerLazySingleton<BaseMovieRepository>(
            () => MoviesRepository(baseMovieRemoteDataSource: sl()));

    /// Movies Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
            () => MovieRemoteDataSource());

    /// Search =>
    /// Search Bloc
    // sl.registerFactory(() => SearchBloc(sl()));
    //
    // /// Search UseCase
    // sl.registerLazySingleton(() => SearchUseCase(baseSearchRepository: sl()));
    //
    // /// Search Repository
    // sl.registerLazySingleton<SearchRepository>(
    //         () => SearchRepositoryImpl(baseSearchRemoteDataSource: sl()));
    //
    // /// Search Data Source
    // sl.registerLazySingleton<SearchRemoteDataSource>(
    //         () => SearchRemoteDataSourceImpl());
  }
}

import 'package:dartz/dartz.dart';

import '../../failed/failed.dart';
import '../../model/movies_model/movies.dart';
import '../../model/movies_model/movie_detail.dart';
import '../../model/movies_model/movies_recomment.dart';
import '../../model/movies_model/movies_similar.dart';
import '../../usecase/movies/get_movie_details_use_case.dart';
import '../../usecase/movies/get_movie_recommendation_usecase.dart';
import '../../usecase/movies/get_movies_similar_usecase.dart';
import 'base_movies_remote_data_source.dart';
import 'base_movies_repository.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository({required this.baseMovieRemoteDataSource});

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getUpcomingMovies() async {
    final result = await baseMovieRemoteDataSource.getUpcomingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  // @override
  // Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
  //   final result = await baseMovieRemoteDataSource.getTopRatedMovies();
  //   try {
  //     return Right(result);
  //   } on ServerException catch (failure) {
  //     return Left(
  //         ServerFailure(message: failure.errorMessageModel.statusMessage));
  //   }
  // }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesRecommendation>>> getMovieRecommendation(
      MovieRecommendationParameters parameters) async {
    final result =
    await baseMovieRemoteDataSource.getMovieRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  // @override
  // Future<Either<Failure, List<MoviesSimilar>>> getMovieSimilar(
  //     MovieSimilarParameters parameters) async {
  //   final result = await baseMovieRemoteDataSource.getMovieSimilar(parameters);
  //   try {
  //     return Right(result);
  //   } on ServerException catch (failure) {
  //     return Left(
  //         ServerFailure(message: failure.errorMessageModel.statusMessage));
  //   }
  // }

  Future<Either<Failure, List<List<Movies>>>> getMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getMovies();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  // @override
  // Future<Either<Failure, List<Movies>>> getAllPopularMovies(int page) async {
  //   try {
  //     final result = await baseMovieRemoteDataSource.getAllPopularMovies(page);
  //     return Right(result);
  //   } on ServerException catch (failure) {
  //     return Left(
  //         ServerFailure(message: failure.errorMessageModel.statusMessage));
  //   }
  // }

  // @override
  // Future<Either<Failure, List<Movies>>> getAllTopRatedMovies(int page) async {
  //   try {
  //     final result = await baseMovieRemoteDataSource.getAllTopRatedMovies(page);
  //     return Right(result);
  //   } on ServerException catch (failure) {
  //     return Left(
  //         ServerFailure(message: failure.errorMessageModel.statusMessage));
  //   }
  // }
}

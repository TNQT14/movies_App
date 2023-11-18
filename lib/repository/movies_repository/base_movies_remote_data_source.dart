import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../failed/failed.dart';
import '../../model/error_message_model.dart';
import '../../model/movies_model/movie_detail.dart';
import '../../model/movies_model/movies.dart';
import '../../model/movies_model/movies_recomment.dart';
import '../../usecase/movies/get_movie_details_use_case.dart';
import '../../usecase/movies/get_movie_recommendation_usecase.dart';
import '../network/api_contants.dart';
abstract class BaseMovieRemoteDataSource {
  // Future<List<MovieModel>> getAllPopularMovies(int page);

  // Future<List<MovieModel>> getAllTopRatedMovies(int page);

  Future<List<List<MovieModel>>> getMovies();

  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getUpcomingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<MoviesRecommendationModel>> getMovieRecommendation(
      MovieRecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      print('Call API getNowPlayingMovies');
      return List<MovieModel>.from((response.data["results"] as List).map(
            (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await Dio().get(ApiConstance.upcomingMoviesPath);
    if (response.statusCode == 200) {
      print('Call API getUpcomingMovies');
      return List<MovieModel>.from((response.data["results"] as List).map(
            (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
        print('Call API getPopularMovies');
      return List<MovieModel>.from((response.data["results"] as List).map(
            (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
    await Dio().get(ApiConstance.movieDetailsPath(parameters.movieID));
    if (response.statusCode == 200) {
      print('Call API getMovieDetails');
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesRecommendationModel>> getMovieRecommendation(
      MovieRecommendationParameters parameters) async {
    final response = await Dio()
        .get(ApiConstance.movieRecommendationPath(parameters.movieID));
    if (response.statusCode == 200) {
      print('Call API getMovieRecommendation');
      return List<MoviesRecommendationModel>.from(
          (response.data["results"] as List).map(
                (e) => MoviesRecommendationModel.fromJson(e),
          ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<List<MovieModel>>> getMovies() async {
    final response = Future.wait(
      [
        getNowPlayingMovies(),
        getPopularMovies(),
        // getTopRatedMovies(),
      ],
      eagerError: true,
    );
    return response;
  }
}

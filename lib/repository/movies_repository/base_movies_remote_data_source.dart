import 'package:dio/dio.dart';

import '../../failed/failed.dart';
import '../../model/error_message_model.dart';
import '../../model/movies_model/movie_detail.dart';
import '../../model/movies_model/movies.dart';
import '../../model/movies_model/movies_recomment.dart';
import '../../model/movies_model/movies_similar.dart';
import '../../usecase/movies/get_movie_details_use_case.dart';
import '../../usecase/movies/get_movie_recommendation_usecase.dart';
import '../../usecase/movies/get_movies_similar_usecase.dart';
import '../network/api_contants.dart';
abstract class BaseMovieRemoteDataSource {
  // Future<List<MovieModel>> getAllPopularMovies(int page);

  // Future<List<MovieModel>> getAllTopRatedMovies(int page);

  Future<List<List<MovieModel>>> getMovies();

  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getUpcomingMovies();

  Future<List<MovieModel>> getPopularMovies();

  // Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<MoviesRecommendationModel>> getMovieRecommendation(
      MovieRecommendationParameters parameters);
  //
  // Future<List<MoviesSimilarModel>> getMovieSimilar(
  //     MovieSimilarParameters parameters);
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

  // @override
  // Future<List<MovieModel>> getTopRatedMovies() async {
  //   final response = await Dio().get(ApiConstance.topRatedMoviesPath);
  //   if (response.statusCode == 200) {
  //     print('Call API getTopRatedMovies');
  //     return List<MovieModel>.from((response.data["results"] as List).map(
  //           (e) => MovieModel.fromJson(e),
  //     ));
  //   } else {
  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //     );
  //   }
  // }

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

  // @override
  // Future<List<MoviesSimilarModel>> getMovieSimilar(
  //     MovieSimilarParameters parameters) async {
  //   final response =
  //   await Dio().get(ApiConstance.movieSimilarPath(parameters.movieID));
  //   if (response.statusCode == 200) {
  //     print('Call API getMovieSimilar');
  //     return List<MoviesSimilarModel>.from(
  //         (response.data["results"] as List).map(
  //               (e) => MoviesSimilarModel.fromJson(e),
  //         ));
  //   } else {
  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //     );
  //   }
  // }

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

  // @override
  // Future<List<MovieModel>> getAllPopularMovies(int page) async {
  //   print('Call API getAllPopularMovies');
  //   final response =
  //   await Dio().get(ApiConstance.getAllPopularMoviesPath(page));
  //   if (response.statusCode == 200) {
  //     return List<MovieModel>.from((response.data['results'] as List)
  //         .map((e) => MovieModel.fromJson(e)));
  //   } else {
  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //     );
  //   }
  // }

//   @override
//   Future<List<MovieModel>> getAllTopRatedMovies(int page) async {
//     final response =
//     await Dio().get(ApiConstance.getAllTopRatedMoviesPath(page));
//     if (response.statusCode == 200) {
//       print('Call API getAllTopRatedMovies');
//       return List<MovieModel>.from((response.data['results'] as List)
//           .map((e) => MovieModel.fromJson(e)));
//     } else {
//       throw ServerException(
//         errorMessageModel: ErrorMessageModel.fromJson(response.data),
//       );
//     }
//   }
}

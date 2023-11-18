import 'package:dartz/dartz.dart';
import '../../failed/failed.dart';
import '../../model/movies_model/movies.dart';
import '../../model/movies_model/movie_detail.dart';
import '../../model/movies_model/movies_recomment.dart';
import '../../model/movies_model/movies_similar.dart';
import '../../usecase/movies/get_movie_recommendation_usecase.dart';
import '../../usecase/movies/get_movie_details_use_case.dart';
import '../../usecase/movies/get_movies_similar_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

  Future<Either<Failure, List<Movies>>> getUpcomingMovies();

  // Future<Either<Failure, List<Movies>>> getAllPopularMovies(int page);

  // Future<Either<Failure, List<Movies>>> getAllTopRatedMovies(int page);

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<MoviesRecommendation>>> getMovieRecommendation(
      MovieRecommendationParameters parameters);

  Future<Either<Failure, List<MoviesSimilar>>> getMovieSimilar(
      MovieSimilarParameters parameters);
}

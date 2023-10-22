import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../failed/failed.dart';
import '../../model/movies_model/movies_recomment.dart';
import '../../repository/movies_repository/base_movies_repository.dart';
import '../base_use_case.dart';

class GetMovieRecommendationUseCase extends BaseUseCase<
    List<MoviesRecommendation>, MovieRecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieRecommendationUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<MoviesRecommendation>>> call(
      MovieRecommendationParameters parameters) async {
    return await baseMovieRepository.getMovieRecommendation(parameters);
  }
}

class MovieRecommendationParameters extends Equatable {
  final int movieID;

  const MovieRecommendationParameters({required this.movieID});

  @override
  List<Object> get props => [movieID];
}

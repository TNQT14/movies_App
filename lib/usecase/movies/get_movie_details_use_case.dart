import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../failed/failed.dart';
import '../../model/movies_model/movie_detail.dart';
import '../../repository/movies_repository/base_movies_repository.dart';
import '../base_use_case.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieID;

  const MovieDetailsParameters({required this.movieID});

  @override
  List<Object> get props => [movieID];
}

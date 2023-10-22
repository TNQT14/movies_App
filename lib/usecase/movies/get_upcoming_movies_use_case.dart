import 'package:dartz/dartz.dart';

import '../../failed/failed.dart';
import '../../model/movies_model/movie.dart';
import '../../repository/movies_repository/base_movies_repository.dart';
import '../base_use_case.dart';

class GetUpcomingMoviesUseCase extends BaseUseCase<List<Movies>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetUpcomingMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getUpcomingMovies();
  }
}
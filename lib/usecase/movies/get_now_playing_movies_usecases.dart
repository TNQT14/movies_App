import 'package:dartz/dartz.dart';
import '../../failed/failed.dart';
import '../../model/movies_model/movies.dart';
import '../../repository/movies_repository/base_movies_repository.dart';
import '../base_use_case.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<Movies>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}

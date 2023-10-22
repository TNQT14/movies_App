import 'package:dartz/dartz.dart';
import '../../failed/failed.dart';
import '../../model/movies_model/movie.dart';
import '../../repository/movies_repository/base_movies_repository.dart';
import '../base_use_case.dart';

class GetAllTopRatedMoviesUseCase extends BaseUseCase<List<Movies>, int> {
  final BaseMovieRepository baseMovieRepository;

  GetAllTopRatedMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movies>>> call(int parameters) async {
    return await baseMovieRepository.getAllTopRatedMovies(parameters);
  }
}

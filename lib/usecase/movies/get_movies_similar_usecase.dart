// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
//
// import '../../failed/failed.dart';
// import '../../model/movies_model/movies_similar.dart';
// import '../../repository/movies_repository/base_movies_repository.dart';
// import '../base_use_case.dart';
//
// class GetMovieSimilarUseCase
//     extends BaseUseCase<List<MoviesSimilar>, MovieSimilarParameters> {
//   final BaseMovieRepository baseMovieRepository;
//
//   GetMovieSimilarUseCase({required this.baseMovieRepository});
//
//   @override
//   Future<Either<Failure, List<MoviesSimilar>>> call(
//       MovieSimilarParameters parameters) async {
//     return await baseMovieRepository.getMovieSimilar(parameters);
//   }
// }
//
// class MovieSimilarParameters extends Equatable {
//   final int movieID;
//
//   const MovieSimilarParameters({required this.movieID});
//
//   @override
//   List<Object> get props => [movieID];
// }

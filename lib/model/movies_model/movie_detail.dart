import 'package:equatable/equatable.dart';
import 'package:movies_app/model/movies_model/review.dart';
import '../../utils/function.dart';
import 'cast.dart';
import 'genres.dart';

class MovieDetails extends Equatable {
  final int? id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final int runtime;
  final bool isAdded;

  const MovieDetails({
    required this.overview,
    this.id,
    required this.title,
    required this.voteAverage,
    required this.backdropPath,
    required this.releaseDate,
    required this.posterPath,
    required this.runtime,
    this.isAdded = false,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    overview,
    isAdded,
  ];
}

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.overview,
    required super.id,
    required super.title,
    required super.voteAverage,
    required super.backdropPath,
    required super.releaseDate,
    required super.posterPath,
    required super.runtime,
  });

  factory MovieDetailsModel.fromMediaDetails(MovieDetails movieDetails) {
    return MovieDetailsModel(
      id: movieDetails.id,
      title: movieDetails.title,
      posterPath: movieDetails.posterPath,
      backdropPath: movieDetails.backdropPath,
      voteAverage: movieDetails.voteAverage,
      releaseDate: movieDetails.releaseDate,
      overview: movieDetails.overview,
      runtime: movieDetails.runtime,
    );
  }

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      overview: json["description"],
      id: int.parse(json["show_id"]),
      title: json["title"],
      voteAverage: double.parse(json["release_year"]),
      backdropPath: json["backdrop_path"] ?? 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2021/5/26/913299/Ngan-Ha25.jpg?fbclid=IwAR2LAgz1UrQ185puuW4TzL-1HOzKtElkVyDssMDcfPCMHS5CmcZ58o7bt9U',
      releaseDate: json["date_added"],
      posterPath: json["poster_path"] ?? 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2021/5/26/913299/Ngan-Ha25.jpg?fbclid=IwAR2LAgz1UrQ185puuW4TzL-1HOzKtElkVyDssMDcfPCMHS5CmcZ58o7bt9U',
      runtime: json["duration"],
    );
  }
}


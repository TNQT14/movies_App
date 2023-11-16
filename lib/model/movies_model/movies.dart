import 'package:equatable/equatable.dart';

import '../../utils/function.dart';

class Movies extends Equatable {
  final int id;
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  // final List<int> genreIds;
  final String backdropPath;
  final String posterPath;
  // final bool adult;
  final bool isAdded;

  const Movies({
    required this.overview,
    required this.id,
    required this.title,
    required this.voteAverage,
    // required this.genreIds,
    required this.backdropPath,
    required this.releaseDate,
    required this.posterPath,
    // required this.adult,
    this.isAdded = false,
  });

  @override
  List<Object> get props => [
    id,
    title,
    backdropPath,
    overview,
    // genreIds,
    posterPath,
    // adult,
    releaseDate,
    isAdded,
  ];
}

class MovieModel extends Movies {
  const MovieModel(
      {required super.overview,
        required super.id,
        required super.title,
        required super.voteAverage,
        // required super.genreIds,
        required super.backdropPath,
        required super.releaseDate,
        required super.posterPath,
        // required super.adult
      });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      overview: json["description"],
      id: int.parse(json["show_id"]),
      title: json["title"],
      voteAverage: double.parse(json["release_year"]),
      // genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      backdropPath: json["backdrop_path"] ?? 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2021/5/26/913299/Ngan-Ha25.jpg?fbclid=IwAR2LAgz1UrQ185puuW4TzL-1HOzKtElkVyDssMDcfPCMHS5CmcZ58o7bt9U',
      releaseDate: getDate(json['date_added']),
      posterPath: json["poster_path"] ?? 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2021/5/26/913299/Ngan-Ha25.jpg?fbclid=IwAR2LAgz1UrQ185puuW4TzL-1HOzKtElkVyDssMDcfPCMHS5CmcZ58o7bt9U',
      // adult: json['adu lt'],
    );
  }
}

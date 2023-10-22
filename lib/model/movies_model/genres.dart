import 'package:equatable/equatable.dart';

class Genres extends Equatable {
  final int id;
  final String name;

  const Genres({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [
    id,
    name,
  ];
}

class GenresModel extends Genres {
  const GenresModel({
    required super.id,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json["id"],
      name: json["name"],
    );
  }
}

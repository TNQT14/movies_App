import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final String name;

  const Cast({
    required this.name,
  });

  @override
  List<Object?> get props => [
    name,
    // profileUrl,
    // gender,
  ];
}

class CastModel extends Cast {
  const CastModel({
    required super.name,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'],
    );
  }
}


import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final String name;
  final String profileUrl;
  final int gender;

  const Cast({
    required this.name,
    required this.profileUrl,
    required this.gender,
  });

  @override
  List<Object?> get props => [
    name,
    profileUrl,
    gender,
  ];
}

class CastModel extends Cast {
  const CastModel({
    required super.name,
    required super.profileUrl,
    required super.gender,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'],
      profileUrl: getProfileImageUrl(json),
      gender: json['gender'],
    );
  }
}


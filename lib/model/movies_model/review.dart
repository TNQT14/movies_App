import 'package:equatable/equatable.dart';

import '../../utils/function.dart';

class Review extends Equatable {
  final String authorName;
  final String authorUserName;
  // final String avatarUrl;
  final double rating;
  final String content;
  final String elapsedTime;

  const Review({
    required this.authorName,
    required this.authorUserName,
    // required this.avatarUrl,
    required this.rating,
    required this.content,
    required this.elapsedTime,
  });

  @override
  List<Object?> get props => [
    authorName,
    authorUserName,
    // avatarUrl,
    rating,
    content,
    elapsedTime,
  ];
}

class ReviewModel extends Review {
  const ReviewModel({
    required super.authorName,
    required super.authorUserName,
    // required super.avatarUrl,
    required super.rating,
    required super.content,
    required super.elapsedTime,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      authorName: json['author'],
      authorUserName: '@${json['author_details']['username']}',
      // avatarUrl: getAvatarUrl(json['author_details']['avatar_path']),
      rating: json['author_details']['rating'] != null
          ? json['author_details']['rating'] / 2
          : -1,
      content: json['content'],
      elapsedTime: getElapsedTime(json['created_at']),
    );
  }
}

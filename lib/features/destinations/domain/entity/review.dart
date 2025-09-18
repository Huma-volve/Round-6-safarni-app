import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final int tourId;
  final int userId;
  final String review;
  final int rating;
  final String createdAt;
  final User user;

  const Review({
    required this.user,
    required this.tourId,
    required this.userId,
    required this.review,
    required this.rating,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [tourId, userId, review, rating, createdAt, user];
}

class User extends Equatable {
  final int id;
  final String name;

  const User({required this.id, required this.name});
  @override
  List<Object?> get props => [id, name];
}

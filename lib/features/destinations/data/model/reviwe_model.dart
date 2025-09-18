import 'package:safarni/features/destinations/domain/entity/review.dart';

class ReviweModel extends Review {
  const ReviweModel({
    required super.user,
    required super.tourId,
    required super.userId,
    required super.review,
    required super.rating,
    required super.createdAt,
  });

  factory ReviweModel.fromJson(Map<String, dynamic> json) => ReviweModel(
    user: UserModel.fromJson(json['user']),
    tourId: json['tour_id'],
    userId: json['user_id'],
    review: json['review'],
    rating: json['rating'],
    createdAt: json['created_at'],
  );
}

class UserModel extends User {
  const UserModel({required super.id, required super.name});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(id: json['id'], name: json['name']);
}

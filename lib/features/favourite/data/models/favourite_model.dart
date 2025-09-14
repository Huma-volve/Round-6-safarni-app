import 'dart:convert';

class FavouriteModel {
  final int id;
  final int categoryId;
  final String title;
  final String location;
  final String description;
  final String price;
  final String image;
  final int views;
  final bool isRecommended;
  final double rating;
  final int durationHours;
  final int maxGroupSize;
  final int minAge;
  final String difficultyLevel;
  final List<String> highlights;
  final String guide;
  final String transportation;
  final List<String> includedServices;
  final List<String> excludedServices;
  final List<String> whatToBring;
  final String cancellationPolicy;
  final String createdAt;
  final String updatedAt;
  final String? favoritedAt;

  FavouriteModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.location,
    required this.description,
    required this.price,
    required this.image,
    required this.views,
    required this.isRecommended,
    required this.rating,
    required this.durationHours,
    required this.maxGroupSize,
    required this.minAge,
    required this.difficultyLevel,
    required this.highlights,
    required this.guide,
    required this.transportation,
    required this.includedServices,
    required this.excludedServices,
    required this.whatToBring,
    required this.cancellationPolicy,
    required this.createdAt,
    required this.updatedAt,
    this.favoritedAt,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json['id'],
      categoryId: json['category_id'],
      title: json['title'],
      location: json['location'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      views: json['views'],
      isRecommended: json['is_recommended'] == 1 || json['is_recommended'] == true,
      rating: (json['rating'] as num).toDouble(),
      durationHours: json['duration_hours'],
      maxGroupSize: json['max_group_size'],
      minAge: json['min_age'],
      difficultyLevel: json['difficulty_level'],
      highlights: _parseList(json['highlights']),
      guide: json['guide'],
      transportation: json['transportation'],
      includedServices: _parseList(json['included_services']),
      excludedServices: _parseList(json['excluded_services']),
      whatToBring: _parseList(json['what_to_bring']),
      cancellationPolicy: json['cancellation_policy'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      favoritedAt: json['favorited_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'title': title,
      'location': location,
      'description': description,
      'price': price,
      'image': image,
      'views': views,
      'is_recommended': isRecommended ? 1 : 0,
      'rating': rating,
      'duration_hours': durationHours,
      'max_group_size': maxGroupSize,
      'min_age': minAge,
      'difficulty_level': difficultyLevel,
      'highlights': highlights,
      'guide': guide,
      'transportation': transportation,
      'included_services': includedServices,
      'excluded_services': excludedServices,
      'what_to_bring': whatToBring,
      'cancellation_policy': cancellationPolicy,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'favorited_at': favoritedAt,
    };
  }

  /// helper عشان يفك الـ JSON اللي جاي كـ String بدل List
  static List<String> _parseList(dynamic data) {
    if (data == null) return [];
    if (data is List) return List<String>.from(data);
    if (data is String) {
      try {
        return List<String>.from(
            (data.startsWith("[") ? (jsonDecode(data)) : []));
      } catch (e) {
        return [];
      }
    }
    return [];
  }
}

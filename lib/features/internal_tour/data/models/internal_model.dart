import 'package:safarni/features/internal_tour/domain/entites/internal_entity.dart';

class TourModel {
  final int id;
  final String title;
  final String description;
  final String price;
  final String image;
  final double rating;

  TourModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) {
    return TourModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      image: json["image"],
      rating: (json["rating"] as num).toDouble(),
    );
  }
}

Tour toEntity(TourModel tour) {
  return Tour(
    id: tour.id,
    title: tour.title,
    description: tour.description,
    price: double.parse("${tour.price}"),
    image: tour.image,
    rating: tour.rating,
  );
}

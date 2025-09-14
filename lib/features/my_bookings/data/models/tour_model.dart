import 'package:safarni/features/my_bookings/domain/entities/tour_booking.dart';

class TourModel extends TourBooking {
  const TourModel({
    required super.title,
    required super.image,
    required super.description,
    required super.price,
    required super.rating,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) {
    return TourModel(
      title: json['title'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'description': description,
      'price': price,
      'rating': rating,
    };
  }
}
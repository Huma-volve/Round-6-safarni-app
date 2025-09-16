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
      title: json['tour_title'] as String,
      image: json['image'] ?? '',
      description: json['notes'] as String,
      price: json['total_price'] as String,
      rating: 4.5,
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
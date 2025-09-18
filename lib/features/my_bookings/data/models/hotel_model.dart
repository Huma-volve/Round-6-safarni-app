import 'package:safarni/features/my_bookings/domain/entities/hotel_booking.dart';

class HotelModel extends HotelBooking{
  HotelModel({
    required super.title,
     super.image,
    required super.location,
    required super.rating,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      title: json['title'],
      image: json['image'] ?? null,
      location: json['location'],
      rating: json['rating']??4.5,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'location': location,
      'rating': rating,
    };
  }
  
}
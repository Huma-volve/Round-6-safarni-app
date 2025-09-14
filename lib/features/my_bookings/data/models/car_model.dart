import 'package:safarni/features/my_bookings/domain/entities/car_booking.dart';

class CarModel  extends CarBooking{
  CarModel({
    required super.model,
    required super.image,
    required super.transmission,
    required super.seats,
    required super.fuel,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      model: json['model'],
      image: json['image'],
      transmission: json['transmission'],
      seats: json['seats'],
      fuel: json['fuel'],
    );
  }
}
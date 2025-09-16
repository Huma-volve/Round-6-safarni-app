import 'package:safarni/features/my_bookings/domain/entities/car_booking.dart';

class CarModel  extends CarBooking{
  CarModel({
    required super.model,
    required super.transmission,
    required super.seats,
    required super.fuel,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      model: json['car']['model'],
      
      transmission: json['car']['transmission'],
      seats: json['car']['seats'],
      fuel: json['car']['fuel_type'],
    );
  }
}
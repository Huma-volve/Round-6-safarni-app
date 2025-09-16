import 'package:safarni/features/car_booking/domain/entits/category_entity.dart';

class Car {
  final int id;
  final String model;
  final String brand;
  final double dailyRate;
  final int seats;
  final String transmission;
  final String fuelType;
  final bool hasAc;
  final Category category;

  Car({
    required this.id,
    required this.model,
    required this.brand,
    required this.dailyRate,
    required this.seats,
    required this.transmission,
    required this.fuelType,
    required this.hasAc,
    required this.category,
  });
}

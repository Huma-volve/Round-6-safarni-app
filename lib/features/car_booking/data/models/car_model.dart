import 'package:safarni/features/car_booking/data/models/category_model.dart';
import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';

class CarModel {
  final int id;
  final String model;
  final String brand;
  final double dailyRate;
  final int seats;
  final String transmission;
  final String fuelType;
  final bool hasAc;
  final CategoryModel category;

  CarModel({
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

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      model: json['model'],
      brand: json['brand'],
      dailyRate: double.parse(json['daily_rate']),
      seats: json['seats'],
      transmission: json['transmission'],
      fuelType: json['fuel_type'],
      hasAc: json['has_ac'] == 1,
      category: CategoryModel.fromJson(json['category']),
    );
  }
}

Car toEntity(CarModel car) {
  return Car(
    id: car.id,
    model: car.model,
    brand: car.brand,
    dailyRate: car.dailyRate,
    seats: car.seats,
    transmission: car.transmission,
    fuelType: car.fuelType,
    hasAc: car.hasAc,
    category: car.category.toEntity(),
  );
}

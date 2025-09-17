import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';
import 'package:safarni/features/car_booking/domain/repositories/car_repository.dart';

class GetCarsUseCase {
  final CarRepository repository;

  GetCarsUseCase(this.repository);

  Future<List<Car>> fetchCar({String? searchQuery}) async {
    final cars = await repository.fetchCars();
    if (searchQuery == null || searchQuery.isEmpty) return cars;
    return cars
        .where(
          (car) =>
              car.model.toLowerCase().contains(searchQuery.toLowerCase()) ||
              car.brand.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }
}

import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
  Future<Car> fetchCarById(int id);
}

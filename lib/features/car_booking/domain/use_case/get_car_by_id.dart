import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';
import 'package:safarni/features/car_booking/domain/repositories/car_repository.dart';

class GetCarsUseCaseById {
  final CarRepository repository;

  GetCarsUseCaseById(this.repository);

  Future<Car> fetchCarById(int id) async {
    return await repository.fetchCarById(id);
  }
}

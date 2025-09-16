import 'package:safarni/features/car_booking/data/models/car_model.dart';
import 'package:safarni/features/car_booking/data/remote_data_source/car_remote_data_source.dart';
import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';
import 'package:safarni/features/car_booking/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final CarRemoteDataSource apiService;

  CarRepositoryImpl(this.apiService);

  @override
  Future<List<Car>> fetchCars() async {
    final carModels = await apiService.fetchCars();
    return carModels.map((model) => toEntity(model)).toList();
  }

  Future<Car> fetchCarById(int id) async {
    final model = await apiService.fetchCarById(id);
    return toEntity(model);
  }
}

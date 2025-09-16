import 'package:get_it/get_it.dart';
import 'package:safarni/features/car_booking/data/remote_data_source/car_remote_data_source.dart';
import 'package:safarni/features/car_booking/data/repositories/car_repository_impl.dart';
import 'package:safarni/features/car_booking/domain/repositories/car_repository.dart';
import 'package:safarni/features/car_booking/domain/use_case/get_car.dart';
import 'package:safarni/features/car_booking/domain/use_case/get_car_by_id.dart';
import 'package:safarni/features/internal_tour/data/remote_data/api_service.dart';
import 'package:safarni/features/internal_tour/data/repo_impl/repo_tour_impl.dart';
import 'package:safarni/features/internal_tour/domain/repo/tour_repo.dart';
import 'package:safarni/features/internal_tour/domain/use_cases/get_tours_use_case.dart';

final getItInstance = GetIt.instance;

Future<void> setupGetIt() async {
  getItInstance.registerLazySingleton<CarRemoteDataSource>(
    () => CarRemoteDataSource(),
  );

  getItInstance.registerLazySingleton<CarRepository>(
    () => CarRepositoryImpl(getItInstance<CarRemoteDataSource>()),
  );

  getItInstance.registerFactory<GetCarsUseCase>(
    () => GetCarsUseCase(getItInstance<CarRepository>()),
  );

  getItInstance.registerLazySingleton<GetCarsUseCaseById>(
    () => GetCarsUseCaseById(getItInstance()),
  );

  getItInstance.registerLazySingleton<TourRemoteDataSource>(
    () => TourRemoteDataSource(),
  );

  getItInstance.registerLazySingleton<TourRepository>(
    () => RepoTourImpl(getItInstance<TourRemoteDataSource>()),
  );

  getItInstance.registerLazySingleton<GetTourUseCase>(
    () => GetTourUseCase(getItInstance<TourRepository>()),
  );
}

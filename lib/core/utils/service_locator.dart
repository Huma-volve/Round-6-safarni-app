import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:safarni/features/destinations/data/data_source/destantion_remote_data_source.dart';
import 'package:safarni/features/destinations/data/repository/destantion_repository.dart';
import 'package:safarni/features/destinations/domain/repository/base_destantion_repository.dart';
import 'package:safarni/features/destinations/domain/usecases/destantion_use_case.dart';
import 'package:safarni/features/destinations/domain/usecases/get_all_activities_use_case.dart';
import 'package:safarni/features/destinations/domain/usecases/get_all_reviwes_use_case.dart';
import 'package:safarni/features/destinations/presentation/cubit/destantion_cubit.dart';
import 'package:safarni/features/fligth_booking/data/data_source/flight_remote_data_source.dart';
import 'package:safarni/features/fligth_booking/data/repository/flight_repository.dart';
import 'package:safarni/features/fligth_booking/domain/repository/base_flight_repository.dart';
import 'package:safarni/features/fligth_booking/domain/usecases/book_a_flight_use_case.dart';
import 'package:safarni/features/fligth_booking/domain/usecases/get_all_flights_use_case.dart';
import 'package:safarni/features/fligth_booking/domain/usecases/get_all_seats_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Dio
  if (!sl.isRegistered<Dio>()) {
    sl.registerLazySingleton<Dio>(() => Dio());
  }

  /// ========== Destination ==========
  sl.registerLazySingleton<BaseDestantionRemoteDataSource>(
    () => DestantionRemoteDataSource(dio: sl()),
  );

  sl.registerLazySingleton<BaseDestantionRepository>(
    () => DestantionRepository(sl()),
  );

  sl.registerLazySingleton(() => DestantionUseCase(sl()));
  sl.registerLazySingleton(() => GetAllActivitiesUesCase(sl()));
  sl.registerLazySingleton(() => GetAllReviwesUseCase(sl()));

  sl.registerFactory(
    () => DestantionCubit(
      sl(), // DestantionUseCase
      sl(), // GetAllReviwesUseCase
      sl(), // GetAllActivitiesUesCase
    ),
  );

  /// ========== Flight ==========
  // Remote data source
  sl.registerLazySingleton<BaseFlightRemoteDataSource>(
    () => FlightRemoteDataSource(),
    // إذا FlightRemoteDataSource يحتاج Dio في الكونستركتور: FlightRemoteDataSource(dio: sl())
  );

  // Repository
  sl.registerLazySingleton<BaseFlightRepository>(
    () => FlightRepository(sl<BaseFlightRemoteDataSource>()),
  );

  // UseCases
  sl.registerLazySingleton<GetAllFlightsUseCase>(
    () => GetAllFlightsUseCase(sl<BaseFlightRepository>()),
  );
  sl.registerLazySingleton<GetSeatsUseCase>(
    () => GetSeatsUseCase(sl<BaseFlightRepository>()),
  );
  sl.registerLazySingleton<BookFlightUseCase>(
    () => BookFlightUseCase(sl<BaseFlightRepository>()),
  );

  // Cubit
}

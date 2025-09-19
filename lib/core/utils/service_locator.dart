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
import 'package:safarni/features/payment/data/data_source/payment_remote_data_source.data.dart';
import 'package:safarni/features/payment/data/repository/payment_repository.dart';
import 'package:safarni/features/payment/domain/repository/base_payment_repository.dart';
import 'package:safarni/features/payment/domain/usecases/payment_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Dio
  if (!sl.isRegistered<Dio>()) {
    sl.registerLazySingleton<Dio>(() => Dio());
  }

  /// ========== Destination ==========
  sl.registerLazySingleton<BaseDestantionRemoteDataSource>(
    () => DestantionRemoteDataSource(),
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
  sl.registerLazySingleton<BasePaymentDataSource>(() => PaymentDataSource());

  // Repository
  sl.registerLazySingleton<BasePaymentRepository>(
    () => PaymentRepository(sl()),
  );

  // UseCase
  sl.registerLazySingleton<PaymentUseCase>(() => PaymentUseCase(sl()));

  // Cubits
  // sl.registerFactory(() => PaymentCubit());
  // sl.registerFactory(() => CheckoutCubit(sl())); // بياخد PaymentUseCase

  // Cubit
}

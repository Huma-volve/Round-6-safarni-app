import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/features/car_booking/domain/use_case/get_car.dart';
import 'package:safarni/features/car_booking/domain/use_case/get_car_by_id.dart';

import 'package:safarni/features/car_booking/presentation/cubit/cubit/car_state.dart';

class CarCubit extends Cubit<CarState> {
  final GetCarsUseCase usecase;
  final GetCarsUseCaseById useCaseById;
  CarCubit(this.usecase, this.useCaseById) : super(CarInitial());

  Future<void> fetchCars({String? searchQuery}) async {
    emit(CarLoading());
    try {
      final cars = await usecase.fetchCar();
      emit(CarLoaded(cars));
    } catch (e) {
      emit(CarError('error: $e'));
    }
  }

  Future<void> fetchCarById(int id) async {
    emit(CarLoading());
    try {
      final car = await useCaseById.fetchCarById(id);
      emit(CarLoadedOne(car));
    } catch (e) {
      emit(CarError("Error: $e"));
    }
  }
}

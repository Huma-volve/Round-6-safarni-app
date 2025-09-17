import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';

abstract class CarState {}

class CarInitial extends CarState {}

class CarLoading extends CarState {}

class CarLoaded extends CarState {
  final List<Car> cars;
  CarLoaded(this.cars);
}

class CarLoadedOne extends CarState {
  final Car car;
  CarLoadedOne(this.car);
}

class CarError extends CarState {
  final String message;
  CarError(this.message);
}

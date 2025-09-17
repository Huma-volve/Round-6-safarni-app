import 'package:safarni/features/internal_tour/domain/entites/internal_entity.dart';

abstract class TourState {}

class TourInitial extends TourState {}

class TourLoading extends TourState {}

class TourLoaded extends TourState {
  final List<Tour> tours;
  TourLoaded(this.tours);
}

class TourError extends TourState {
  final String message;
  TourError(this.message);
}

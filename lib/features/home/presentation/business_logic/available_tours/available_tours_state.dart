part of 'available_tours_cubit.dart';

@immutable
sealed class AvailableToursState {}

final class AvailableToursInitial extends AvailableToursState {}

final class AvailableToursLoading extends AvailableToursState {}

final class AvailableToursLoaded extends AvailableToursState {
  final List<AvailableTourModel> availableTours;

  AvailableToursLoaded({required this.availableTours});
}

final class AvailableToursError extends AvailableToursState {
  final String error;

  AvailableToursError({required this.error});
}

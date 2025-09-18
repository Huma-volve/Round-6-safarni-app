part of 'rooms_cubit.dart';

sealed class RoomsState extends Equatable {
  const RoomsState();

  @override
  List<Object> get props => [];
}

final class RoomsInitial extends RoomsState {}

final class RoomsLoading extends RoomsState {}

final class RoomsSuccess extends RoomsState {
  final List<RoomsEntity> rooms;

  const RoomsSuccess({required this.rooms});
}

final class RoomsFailure extends RoomsState {
  final String errorMessage;
  const RoomsFailure({required this.errorMessage});
}

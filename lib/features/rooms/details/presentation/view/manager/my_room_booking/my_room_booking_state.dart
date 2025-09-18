part of 'my_room_booking_cubit.dart';

sealed class MyRoomBookingState extends Equatable {
  const MyRoomBookingState();

  @override
  List<Object> get props => [];
}

final class MyRoomBookingInitial extends MyRoomBookingState {}

final class MyRoomBookingLoading extends MyRoomBookingState {}

final class MyRoomBookingFailure extends MyRoomBookingState {
  final String errorMessage;
  const MyRoomBookingFailure({required this.errorMessage});
}

final class MyRoomBookingSuccess extends MyRoomBookingState {}

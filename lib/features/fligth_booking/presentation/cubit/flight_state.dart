part of 'flight_cubit.dart';

abstract class FlightState extends Equatable {
  const FlightState();

  @override
  List<Object?> get props => [];
}

class FlightInitial extends FlightState {}

class FlightLoading extends FlightState {}

class FlightLoaded extends FlightState {
  final List<Flight> flights;
  const FlightLoaded(this.flights);
  @override
  List<Object?> get props => [flights];
}

class FlightError extends FlightState {
  final String message;
  const FlightError(this.message);
  @override
  List<Object?> get props => [message];
}

// Seats
class SeatsLoading extends FlightState {}

class SeatsLoaded extends FlightState {
  final List<Seat> seats;
  const SeatsLoaded(this.seats);
  @override
  List<Object?> get props => [seats];
}

class SeatsError extends FlightState {
  final String message;
  const SeatsError(this.message);
  @override
  List<Object?> get props => [message];
}

// Booking
class BookingLoading extends FlightState {}

class BookingSuccess extends FlightState {
  final FlightBooking booking;
  const BookingSuccess(this.booking);
  @override
  List<Object?> get props => [booking];
}

class BookingError extends FlightState {
  final String message;
  const BookingError(this.message);
  @override
  List<Object?> get props => [message];
}

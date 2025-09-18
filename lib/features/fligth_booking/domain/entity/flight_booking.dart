import 'package:equatable/equatable.dart';

class FlightBooking extends Equatable {
  final int id;
  final dynamic flightId;
  final int seatId;
  final String bookingDate;
  final int totalPrice;
  final String status;
  final String updatedAt;
  final String createdAt;
  final int userId;

  const FlightBooking({
    required this.id,
    required this.flightId,
    required this.seatId,
    required this.bookingDate,
    required this.totalPrice,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.userId,
  });

  @override
  List<Object?> get props => [
    id,
    flightId,
    status,
    totalPrice,
    seatId,
    bookingDate,
    updatedAt,
    createdAt,
    userId,
  ];
}

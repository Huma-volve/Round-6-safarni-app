import 'package:equatable/equatable.dart';

class Seat extends Equatable {
  final int id;
  final int flightId;
  final int seatNumber;
  final String status;

  const Seat({
    required this.id,
    required this.flightId,
    required this.seatNumber,
    required this.status,
  });

  @override
  List<Object?> get props => [id, flightId, seatNumber, status];
}

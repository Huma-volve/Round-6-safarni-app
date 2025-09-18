import 'package:safarni/features/fligth_booking/domain/entity/seat.dart';

class SeatsModel extends Seat {
  SeatsModel({
    required super.id,
    required super.flightId,
    required super.seatNumber,
    required super.status,
  });
  factory SeatsModel.fromJson(Map<String, dynamic> json) => SeatsModel(
    id: json['id'],
    flightId: json['flight_id'],
    seatNumber: json['seat_number'],
    status: json['status'],
  );
}

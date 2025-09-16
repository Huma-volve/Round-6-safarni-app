
import 'package:safarni/features/my_bookings/domain/entities/flight_booking.dart';

class FlightModel extends FlightBooking {
  FlightModel({
    required super.airline,
    required super.date,
    required super.departureTime,
    required super.arrivalTime,
    required super.from,
    required super.to,
    required super.gate,
    required super.seat,
    required super.terminal,
    required super.flightNo,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    return FlightModel(
      airline: json['airline'],
      date: json['date'],
      departureTime: json['departure_time'],
      arrivalTime: json['arrival_time'],
      from: json['from'],
      to: json['to'],
      gate: json['gate'],
      seat: json['seat'],
      terminal: json['terminal'],
      flightNo: json['flight_no'],
    );
  }
}

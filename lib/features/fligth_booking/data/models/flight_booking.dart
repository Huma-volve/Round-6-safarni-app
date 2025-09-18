import 'package:safarni/features/fligth_booking/domain/entity/flight_booking.dart';

class FlightBookingModel extends FlightBooking {
  const FlightBookingModel({
    required super.id,
    required super.flightId,
    required super.seatId,
    required super.bookingDate,
    required super.totalPrice,
    required super.status,
    required super.updatedAt,
    required super.createdAt,
    required super.userId,
  });

  factory FlightBookingModel.fromJson(Map<String, dynamic> json) =>
      FlightBookingModel(
        id: json['id'],
        flightId: json['flight_id'],
        seatId: json['seat_id'],
        bookingDate: json['booking_date'],
        totalPrice: json['total_price'],
        status: json['status'],
        updatedAt: json['updated_at'],
        createdAt: json['created_at'],
        userId: json['user_id'],
      );
}

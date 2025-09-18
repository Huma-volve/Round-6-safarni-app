import 'package:safarni/features/fligth_booking/domain/entity/flight.dart';
import 'package:safarni/features/fligth_booking/domain/entity/seat.dart';
import 'package:safarni/features/fligth_booking/domain/entity/flight_booking.dart';

abstract class BaseFlightRepository {
  Future<List<Flight>> getAllFlights({
    required String from,
    required String to,
    required String date,
  });
  Future<List<Seat>> getAllSeats(int flightId);
  Future<FlightBooking> bookingFlight({
    required int flightId,
    required int seatId,
  });
}

import 'package:safarni/features/fligth_booking/domain/entity/flight_booking.dart';
import 'package:safarni/features/fligth_booking/domain/repository/base_flight_repository.dart';

class BookFlightUseCase {
  final BaseFlightRepository repository;

  BookFlightUseCase(this.repository);

  Future<FlightBooking> execute({
    required int flightId,
    required int seatId,
  }) async {
    return await repository.bookingFlight(flightId: flightId, seatId: seatId);
  }
}

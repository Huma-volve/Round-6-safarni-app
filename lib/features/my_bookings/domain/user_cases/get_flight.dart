import 'package:safarni/features/my_bookings/domain/entities/flight_booking.dart';
import 'package:safarni/features/my_bookings/domain/repositories/my_booking_repository.dart';

class GetFlights {
  final BookingRepository repository;
  GetFlights(this.repository);

  Future<List<FlightBooking>> call() => repository.getFlights();
}

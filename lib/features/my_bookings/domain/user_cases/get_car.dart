import 'package:safarni/features/my_bookings/domain/entities/car_booking.dart';
import 'package:safarni/features/my_bookings/domain/entities/flight_booking.dart';
import 'package:safarni/features/my_bookings/domain/repositories/my_booking_repository.dart';

class GetCars {
  final BookingRepository repository;
  GetCars(this.repository);

  Future<List<CarBooking>> call() => repository.getCars();
}

import 'package:safarni/features/my_bookings/domain/entities/tour_booking.dart';
import 'package:safarni/features/my_bookings/domain/repositories/my_booking_repository.dart';

class GetTours {
  final BookingRepository repository;
  GetTours(this.repository);

  Future<List<TourBooking>> call() => repository.getTours();
}

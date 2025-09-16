import 'package:safarni/features/my_bookings/domain/entities/hotel_booking.dart';
import 'package:safarni/features/my_bookings/domain/repositories/my_booking_repository.dart';

class GetHotels{
  final BookingRepository repository;
  GetHotels(this.repository);

  Future<List<HotelBooking>> call() => repository.getHotels();
}
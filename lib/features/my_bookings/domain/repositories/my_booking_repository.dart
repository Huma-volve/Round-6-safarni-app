
import 'package:safarni/features/my_bookings/domain/entities/car_booking.dart';
import 'package:safarni/features/my_bookings/domain/entities/flight_booking.dart';
import 'package:safarni/features/my_bookings/domain/entities/hotel_booking.dart';
import 'package:safarni/features/my_bookings/domain/entities/tour_booking.dart';
abstract class BookingRepository {
  Future<List<FlightBooking>> getFlights();
   Future<List<CarBooking>> getCars();
   Future<List<TourBooking>> getTours();
   Future<List<HotelBooking>> getHotels();
}

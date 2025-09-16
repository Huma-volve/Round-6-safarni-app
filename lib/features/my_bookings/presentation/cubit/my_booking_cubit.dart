import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/features/my_bookings/domain/entities/car_booking.dart';
import 'package:safarni/features/my_bookings/domain/entities/hotel_booking.dart';
import 'package:safarni/features/my_bookings/domain/entities/tour_booking.dart';
import 'package:safarni/features/my_bookings/domain/user_cases/get_car.dart';
import 'package:safarni/features/my_bookings/domain/user_cases/get_flight.dart';
import 'package:safarni/features/my_bookings/domain/user_cases/get_hotel.dart';
import 'package:safarni/features/my_bookings/domain/user_cases/get_tour.dart';
import '../../domain/entities/flight_booking.dart';

class BookingsCubit extends Cubit<BookingsState> {
  final GetFlights getFlights;
  final GetCars getCars;
  final GetTours getTours;
  final GetHotels getHotels;

  BookingsCubit({
    required this.getFlights,
    required this.getCars,
    required this.getTours,
    required this.getHotels,
  }) : super(BookingsInitial());

  Future<void> loadAll() async {
    emit(BookingsLoading());
    try {
      final flights = await getFlights();
      final cars = await getCars();
      final tours = await getTours();
      final hotels = await getHotels();
      emit(
        BookingsLoaded(
          flights: flights,
          cars: cars,
          tours: tours,
          hotels: hotels,
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}

// states
abstract class BookingsState {}

class BookingsInitial extends BookingsState {}

class BookingsLoading extends BookingsState {}

class BookingsLoaded extends BookingsState {
  final List<FlightBooking> flights;
  final List<CarBooking> cars;
  final List<TourBooking> tours;
  final List<HotelBooking> hotels;
  BookingsLoaded({
    required this.flights,
    required this.cars,
    required this.tours,
    required this.hotels,
  });
}

class BookingsError extends BookingsState {
  final String message;
  BookingsError(this.message);
}

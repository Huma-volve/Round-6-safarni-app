// repositories/booking_repository_impl.dart
import 'package:dio/dio.dart';
import '../../domain/entities/flight_booking.dart';
import '../../domain/entities/car_booking.dart';
import '../../domain/entities/hotel_booking.dart';
import '../../domain/entities/tour_booking.dart';
import '../../domain/repositories/my_booking_repository.dart';
import '../models/flight_model.dart';
import '../models/car_model.dart';
import '../models/hotel_model.dart';
import '../models/tour_model.dart';

class BookingRepositoryImpl implements BookingRepository {
  final Dio dio;
  BookingRepositoryImpl(this.dio);

  @override
  Future<List<FlightBooking>> getFlights() async {
    final res = await dio.get('https://talentflowa.com/api-test/bookings/flight');
    return (res.data as List)
        .map((json) => FlightModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<CarBooking>> getCars() async {
    final res = await dio.get('https://talentflowa.com/api-test/bookings/cars');
    return (res.data as List).map((json) => CarModel.fromJson(json)).toList();
  }

  @override
  Future<List<TourBooking>> getTours() async {
    final res = await dio.get('https://talentflowa.com/api-test/bookings/tours');
    return (res.data as List).map((json) => TourModel.fromJson(json)).toList();
  }

  @override
  Future<List<HotelBooking>> getHotels() async {
    final res = await dio.get('https://talentflowa.com/api-test/bookings/hotel');
    return (res.data as List).map((json) => HotelModel.fromJson(json)).toList();
  }
}

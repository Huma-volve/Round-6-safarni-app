// repositories/booking_repository_impl.dart
import 'dart:convert';
import '';
import 'package:dio/dio.dart';
import 'package:safarni/core/constants/api_urls.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/cache_helper.dart';
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

  Future<String?> _getToken() async {
    final userJson = await sl<CacheHelper>().getData('user');
    return userJson != null ? jsonDecode(userJson)['token'] : null;
  }

  Future<Options> _getOptions() async {
    final token = await _getToken();
    return Options(
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
  }

  @override
  Future<List<FlightBooking>> getFlights() async {
    final options = await _getOptions();
    final res = await dio.get(
      'https://talentflowa.com/api-test/bookings/flight',
      options: options,
    );
    return (res.data as List)
        .map((json) => FlightModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<CarBooking>> getCars() async {
    final options = await _getOptions();
    final res = await dio.get(ApiUrls.myCarBooking, options: options);
    return (res.data as List).map((json) => CarModel.fromJson(json)).toList();
  }

  @override
  Future<List<TourBooking>> getTours() async {
    final options = await _getOptions();
    final res = await dio.get(ApiUrls.myTourBooking, options: options);
    print('cars: ${res.data}');
    final List<dynamic> data = res.data['data'];
    return data.map((json) => TourModel.fromJson(json)).toList();
  }

  @override
  Future<List<HotelBooking>> getHotels() async {
    final options = await _getOptions();
    final res = await dio.get(
      'https://talentflowa.com/api-test/bookings/hotel',
      options: options,
    );
    return (res.data as List).map((json) => HotelModel.fromJson(json)).toList();
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:safarni/core/constants/api_constants.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/scripts_keys.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/cache_helper.dart';

import 'package:safarni/features/fligth_booking/data/models/flight_booking.dart';
import 'package:safarni/features/fligth_booking/data/models/flights_model.dart';
import 'package:safarni/features/fligth_booking/data/models/seats_model.dart';

abstract class BaseFlightRemoteDataSource {
  Future<List<FlightsModel>> getAllFlights({
    required String from,
    required String to,
    required String date,
  });
  Future<List<SeatsModel>> getAllSeats(int flightId);
  Future<FlightBookingModel> bookingFlight({
    required int flightId,
    required int seatId,
  });
}

class FlightRemoteDataSource implements BaseFlightRemoteDataSource {
  Future<String?> _getToken() async {
    final userJson = await sl<CacheHelper>().getData('user');
    return userJson != null ? jsonDecode(userJson)['token'] : null;
  }

  Future<Dio> createDio() async {
    final token = await _getToken();
    return Dio(
      BaseOptions(
        baseUrl: AppStrings.homeBaseUrl,
        headers: {if (token != null) 'Authorization': 'Bearer $token'},
      ),
    );
  }

  @override
  Future<List<FlightsModel>> getAllFlights({
    required String from,
    required String to,
    required String date,
  }) async {
    final dio = await createDio();
    final response = await dio.get(
      ApiConstants.allFlights,
      queryParameters: {'from': from, 'to': to, 'date': date},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return List<FlightsModel>.from(
        (response.data['data'] as List).map((e) => FlightsModel.fromJson(e)),
      );
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<SeatsModel>> getAllSeats(int fligthId) async {
    final dio = await createDio();
    final response = await dio.get(ApiConstants.allseats(fligthId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return List<SeatsModel>.from(
        (response.data['data']['flight_seats'] as List).map(
          (e) => SeatsModel.fromJson(e),
        ),
      );
    } else {
      throw Exception();
    }
  }

  @override
  Future<FlightBookingModel> bookingFlight({
    required int flightId,
    required int seatId,
  }) async {
    final dio = await createDio();
    final response = await dio.post(
      ApiConstants.bookAFlight,
      data: {'flight_id': flightId, 'seat_id': seatId},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return FlightBookingModel.fromJson(response.data['data']['booking']);
    } else {
      throw Exception(
        'Status Code: ${response.statusCode}, Body: ${response.data}',
      );
    }
  }
}

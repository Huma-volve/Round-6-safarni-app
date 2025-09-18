import 'package:dio/dio.dart';
import 'package:safarni/core/constants/api_constants.dart';
import 'package:safarni/core/constants/stript_key.dart';
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
  @override
  Future<List<FlightsModel>> getAllFlights({
    required String from,
    required String to,
    required String date,
  }) async {
    final response = await Dio().get(
      ApiConstants.allFlights,
      queryParameters: {'from': from, 'to': to, 'date': date},
      options: Options(
        headers: {'Authorization': 'Bearer ${ScriptKeys.token}'},
      ),
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
    final response = await Dio().get(
      ApiConstants.allseats(fligthId),
      options: Options(
        headers: {'Authorization': 'Bearer ${ScriptKeys.token}'},
      ),
    );
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
    final response = await Dio().post(
      ApiConstants.bookAFlight,
      data: {'flight_id': flightId, 'seat_id': seatId},
      options: Options(
        headers: {'Authorization': 'Bearer ${ScriptKeys.token}'},
      ),
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

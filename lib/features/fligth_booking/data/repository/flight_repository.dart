import 'package:safarni/features/fligth_booking/data/data_source/flight_remote_data_source.dart';
import 'package:safarni/features/fligth_booking/domain/entity/flight.dart';
import 'package:safarni/features/fligth_booking/domain/entity/seat.dart';
import 'package:safarni/features/fligth_booking/domain/entity/flight_booking.dart';
import 'package:safarni/features/fligth_booking/domain/repository/base_flight_repository.dart';

class FlightRepository implements BaseFlightRepository {
  final BaseFlightRemoteDataSource remoteDataSource;

  FlightRepository(this.remoteDataSource);

  @override
  Future<List<Flight>> getAllFlights({
    required String from,
    required String to,
    required String date,
  }) async {
    return await remoteDataSource.getAllFlights(from: from, to: to, date: date);
  }

  @override
  Future<List<Seat>> getAllSeats(int flightId) async {
    return await remoteDataSource.getAllSeats(flightId);
  }

  @override
  Future<FlightBooking> bookingFlight({
    required int flightId,
    required int seatId,
  }) async {
    return await remoteDataSource.bookingFlight(
      flightId: flightId,
      seatId: seatId,
    );
  }
}

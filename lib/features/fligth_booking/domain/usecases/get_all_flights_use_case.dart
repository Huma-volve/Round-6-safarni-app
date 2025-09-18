import 'package:safarni/features/fligth_booking/domain/entity/flight.dart';
import 'package:safarni/features/fligth_booking/domain/repository/base_flight_repository.dart';

class GetAllFlightsUseCase {
  final BaseFlightRepository repository;

  GetAllFlightsUseCase(this.repository);

  Future<List<Flight>> execute(GetAllFlightsParameters params) async {
    return await repository.getAllFlights(
      from: params.from,
      to: params.to,
      date: params.date,
    );
  }
}

class GetAllFlightsParameters {
  final String from;
  final String to;
  final String date;

  GetAllFlightsParameters({
    required this.from,
    required this.to,
    required this.date,
  });
}

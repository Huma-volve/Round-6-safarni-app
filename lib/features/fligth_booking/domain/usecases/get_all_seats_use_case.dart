import 'package:safarni/features/fligth_booking/domain/entity/seat.dart';
import 'package:safarni/features/fligth_booking/domain/repository/base_flight_repository.dart';

class GetSeatsUseCase {
  final BaseFlightRepository repository;

  GetSeatsUseCase(this.repository);

  Future<List<Seat>> execute(int flightId) async {
    return await repository.getAllSeats(flightId);
  }
}

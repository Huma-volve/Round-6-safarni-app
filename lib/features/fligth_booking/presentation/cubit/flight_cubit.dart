// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:safarni/features/fligth_booking/domain/entity/flight.dart';
// import 'package:safarni/features/fligth_booking/domain/entity/flight_booking.dart';
// import 'package:safarni/features/fligth_booking/domain/entity/seat.dart';

// part 'flight_state.dart';

// class FlightCubit extends Cubit<FlightState> {
//   FlightCubit() : super(FlightInitial());

// }

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safarni/features/fligth_booking/domain/entity/flight.dart';
import 'package:safarni/features/fligth_booking/domain/entity/seat.dart';
import 'package:safarni/features/fligth_booking/domain/entity/flight_booking.dart';
import 'package:safarni/features/fligth_booking/domain/usecases/book_a_flight_use_case.dart';
import 'package:safarni/features/fligth_booking/domain/usecases/get_all_flights_use_case.dart';
import 'package:safarni/features/fligth_booking/domain/usecases/get_all_seats_use_case.dart';

part 'flight_state.dart';

class FlightCubit extends Cubit<FlightState> {
  final GetAllFlightsUseCase getAllFlightsUseCase;
  final GetSeatsUseCase getSeatsUseCase;
  final BookFlightUseCase bookFlightUseCase;

  FlightCubit(
    this.getAllFlightsUseCase,
    this.getSeatsUseCase,
    this.bookFlightUseCase,
  ) : super(FlightInitial());

  Future<void> fetchFlights({
    required String from,
    required String to,
    required String date,
  }) async {
    emit(FlightLoading());
    try {
      final flights = await getAllFlightsUseCase.execute(
        GetAllFlightsParameters(from: from, to: to, date: date),
      );
      emit(FlightLoaded(flights));
    } catch (e) {
      emit(FlightError(e.toString()));
    }
  }

  // Get seats for a flight
  Future<void> fetchSeats(int flightId) async {
    emit(SeatsLoading());
    try {
      final seats = await getSeatsUseCase.execute(flightId);
      emit(SeatsLoaded(seats));
    } catch (e) {
      emit(SeatsError(e.toString()));
    }
  }

  // Book a seat
  Future<void> bookFlight({required int flightId, required int seatId}) async {
    emit(BookingLoading());
    try {
      final booking = await bookFlightUseCase.execute(
        flightId: flightId,
        seatId: seatId,
      );
      emit(BookingSuccess(booking));
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }
}

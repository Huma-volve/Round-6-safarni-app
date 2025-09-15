import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safarni/features/rooms/details/domain/entity/my_room_booking_entity.dart';
import 'package:safarni/features/rooms/details/domain/room_details_use_case/my_room_booking_use_case.dart';

part 'my_room_booking_state.dart';

class MyRoomBookingCubit extends Cubit<MyRoomBookingState> {
  MyRoomBookingCubit(this.myRoomBookingUseCase) : super(MyRoomBookingInitial());
  final MyRoomBookingUseCase myRoomBookingUseCase;

  Future<void> addRoomBooking({
    required MyRoomBookingEntity roomBooking,
    required String token,
  }) async {
    emit(MyRoomBookingLoading());
    try {
      await myRoomBookingUseCase.call(roomBooking: roomBooking, token: token);
      emit(MyRoomBookingSuccess());
    } catch (e) {
      emit(MyRoomBookingFailure(errorMessage: e.toString()));
    }
  }
}

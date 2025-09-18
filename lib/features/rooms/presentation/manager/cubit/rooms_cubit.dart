import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safarni/features/rooms/domain/entity/rooms_entity.dart';
import 'package:safarni/features/rooms/domain/usecase/room_use_case.dart';

part 'rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  RoomsCubit(this.roomUseCase) : super(RoomsInitial());
  final RoomUseCase roomUseCase;

  Future<void> getRooms({required int id}) async {
    emit(RoomsLoading());
    final result = await roomUseCase.call(id: id);
    result.fold(
      (failure) => emit(RoomsFailure(errorMessage: failure.errorMessage)),
      (rooms) => emit(RoomsSuccess(rooms: rooms)),
    );
  }
}

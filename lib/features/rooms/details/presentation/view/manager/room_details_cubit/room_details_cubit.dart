import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';
import 'package:safarni/features/rooms/details/domain/room_details_use_case/room_details_use_case.dart';

part 'room_details_state.dart';

class RoomDetailsCubit extends Cubit<RoomDetailsState> {
  RoomDetailsCubit(this.roomDetailsUseCase) : super(RoomDetailsInitial());
  final RoomDetailsUseCase roomDetailsUseCase;

  Future<void> getRoomDetails({required int id}) async {
    emit(RoomDetailsLoading());
    final result = await roomDetailsUseCase.call(id: id);
    result.fold(
      (failure) => emit(RoomDetailsFailure(failure.errorMessage)),
      (roomDetails) => emit(RoomDetailsSuccess(roomDetails)),
    );
  }
}

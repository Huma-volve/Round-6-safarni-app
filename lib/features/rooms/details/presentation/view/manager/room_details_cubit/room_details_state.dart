part of 'room_details_cubit.dart';

sealed class RoomDetailsState extends Equatable {
  const RoomDetailsState();

  @override
  List<Object> get props => [];
}

final class RoomDetailsInitial extends RoomDetailsState {}

final class RoomDetailsLoading extends RoomDetailsState {}

final class RoomDetailsSuccess extends RoomDetailsState {
  final RoomDetailsEntity roomDetailsEntities;
  const RoomDetailsSuccess(this.roomDetailsEntities);
}

final class RoomDetailsFailure extends RoomDetailsState {
  final String errorMessage;
  const RoomDetailsFailure(this.errorMessage);
}

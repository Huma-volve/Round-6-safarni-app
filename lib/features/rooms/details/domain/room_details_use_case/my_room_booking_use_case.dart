import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/details/data/model/my_room_booking_model.dart';
import 'package:safarni/features/rooms/details/domain/entity/my_room_booking_entity.dart';
import 'package:safarni/features/rooms/details/domain/repo/my_room_booking_repo.dart';

class MyRoomBookingUseCase {
  final MyRoomBookingRepo myRoomBookingRepo;

  MyRoomBookingUseCase({required this.myRoomBookingRepo});
  Future<Either<Failure, MyRoomBookingModel>> call({
    required MyRoomBookingEntity roomBooking,
  }) async {
    return await myRoomBookingRepo.addRoomBooking(roomBooking: roomBooking);
  }
}

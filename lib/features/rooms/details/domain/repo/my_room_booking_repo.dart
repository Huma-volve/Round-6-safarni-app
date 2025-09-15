import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/details/data/model/my_room_booking_model.dart';
import 'package:safarni/features/rooms/details/domain/entity/my_room_booking_entity.dart';

abstract class MyRoomBookingRepo {
  Future<Either<Failure, MyRoomBookingModel>> addRoomBooking({
    required MyRoomBookingEntity roomBooking,
    required String token,
  });
}

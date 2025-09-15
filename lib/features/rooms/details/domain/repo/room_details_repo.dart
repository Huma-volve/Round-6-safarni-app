import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';

abstract class RoomDetailsRepo {
  Future<Either<Failure, RoomDetailsEntity>> getRoomDetails({required int id});
}

import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/domain/entity/rooms_entity.dart';

abstract class RoomRepo {
  Future<Either<Failure, List<RoomsEntity>>> getRooms({required int id});
}

import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/domain/entity/rooms_entity.dart';
import 'package:safarni/features/rooms/domain/repo/room_repo.dart';

class RoomUseCase {
  final RoomRepo roomRepo;

  RoomUseCase({required this.roomRepo});
  Future<Either<Failure, List<RoomsEntity>>> call({required int id}) async {
    return await roomRepo.getRooms(id: id);
  }
}

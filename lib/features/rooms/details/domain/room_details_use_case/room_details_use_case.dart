import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';
import 'package:safarni/features/rooms/details/domain/repo/room_details_repo.dart';

class RoomDetailsUseCase {
  final RoomDetailsRepo roomRepo;
  RoomDetailsUseCase({required this.roomRepo});

  Future<Either<Failure, RoomDetailsEntity>> call({required int id}) async {
    return await roomRepo.getRoomDetails(id: id);
  }
}

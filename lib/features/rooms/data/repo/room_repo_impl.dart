import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/data/api_source/room_api_source.dart';
import 'package:safarni/features/rooms/data/model/rooms_model.dart';
import 'package:safarni/features/rooms/domain/entity/rooms_entity.dart';
import 'package:safarni/features/rooms/domain/repo/room_repo.dart';

class RoomRepoImpl extends RoomRepo {
  final RoomApiSource apiSource;

  RoomRepoImpl({required this.apiSource});

  @override
  Future<Either<Failure, List<RoomsEntity>>> getRooms({required int id}) async {
    try {
      final data = await apiSource.get(endPoint: 'hotel/rooms/$id');
      final List<RoomsEntity> rooms = [];
      for (var item in data['data']) {
        rooms.add(RoomsModel.fromJson(item).toEntity());
      }
      return Right(rooms);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

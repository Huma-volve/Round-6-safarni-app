import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/hotel_booking/data/data_source/api_source.dart';
import 'package:safarni/features/rooms/details/data/model/room_details_model.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';
import 'package:safarni/features/rooms/details/domain/repo/room_details_repo.dart';

class RoomDetailsRepoImpl extends RoomDetailsRepo {
  final HotelApiSource apiSource;
  RoomDetailsRepoImpl({required this.apiSource});

  @override
  Future<Either<Failure, RoomDetailsEntity>> getRoomDetails({
    required int id,
  }) async {
    try {
      final data = await apiSource.get(endPoint: 'room/details/$id');

      return Right(RoomDetailsModel.fromJson(data['data']).toEntity());
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

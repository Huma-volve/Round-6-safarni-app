import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/details/data/details_api_source/my_room_booking_api_source.dart';
import 'package:safarni/features/rooms/details/data/model/my_room_booking_model.dart';
import 'package:safarni/features/rooms/details/domain/entity/my_room_booking_entity.dart';
import 'package:safarni/features/rooms/details/domain/repo/my_room_booking_repo.dart';

class MyRoomBookingRepoImpl extends MyRoomBookingRepo {
  final MyRoomBookingApiSource apiSource;

  MyRoomBookingRepoImpl({required this.apiSource});

  @override
  Future<Either<Failure, MyRoomBookingModel>> addRoomBooking({
    required MyRoomBookingEntity roomBooking,
    required String token,
  }) async {
    try {
      final response = await apiSource.postRoom(
        endPoint: 'my/room/bookings',
        data: MyRoomBookingModel.fromEntity(roomBooking).toJson(),
        token: token,
      );
      return Right(MyRoomBookingModel.fromJson(response));
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Failed to book room: $e'));
    }
  }
}

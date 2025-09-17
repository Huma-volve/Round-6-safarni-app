import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/hotel_booking/data/data_source/api_source.dart';
import 'package:safarni/features/hotel_booking/data/models/hotels/hotels_model.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/hotel_booking/domain/repo/hotel_booking_repo.dart';

class HotelBookingRepoImpl extends HotelBookingRepo {
  final HotelApiSource apiSource;

  HotelBookingRepoImpl({required this.apiSource});
  @override
  Future<Either<Failure, List<HotelsEntity>>> getHotelBooking() async {
    try {
      final data = await apiSource.get(endPoint: 'hotels');
      final List<HotelsEntity> hotels = [];
      for (var item in data['data']) {
        hotels.add(HotelsModel.fromJson(item).toEntity());
      }
      return Right(hotels);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

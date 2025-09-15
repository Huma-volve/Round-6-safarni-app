import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';

abstract class HotelBookingRepo {
  Future<Either<Failure, List<HotelsEntity>>> getHotelBooking();
}

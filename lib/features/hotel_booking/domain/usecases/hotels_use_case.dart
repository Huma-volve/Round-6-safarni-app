import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/hotel_booking/domain/repo/hotel_booking_repo.dart';

class HotelsUseCase {
  final HotelBookingRepo hotelBookingRepo;
  HotelsUseCase({required this.hotelBookingRepo});
  Future<Either<Failure, List<HotelsEntity>>> call() async {
    return await hotelBookingRepo.getHotelBooking();
  }
}

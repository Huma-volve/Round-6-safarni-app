import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/destinations/domain/entity/review.dart';
import 'package:safarni/features/destinations/domain/repository/base_destantion_repository.dart';

class GetAllReviwesUseCase {
  final BaseDestantionRepository baseDestantionRepository;

  GetAllReviwesUseCase(this.baseDestantionRepository);

  Future<Either<Failuree, List<Review>>> execute(int tourId) async {
    return await baseDestantionRepository.getAllReviwes(tourId);
  }
}

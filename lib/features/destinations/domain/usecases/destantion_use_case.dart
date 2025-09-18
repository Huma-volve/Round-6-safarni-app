import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/destinations/domain/entity/destantion.dart';
import 'package:safarni/features/destinations/domain/repository/base_destantion_repository.dart';

class DestantionUseCase {
  final BaseDestantionRepository baseDestantionRepository;

  DestantionUseCase(this.baseDestantionRepository);

  Future<Either<Failuree, Destantion>> execute(int id) async {
    return await baseDestantionRepository.getDestantion(id);
  }
}

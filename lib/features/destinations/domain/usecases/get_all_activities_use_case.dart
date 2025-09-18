import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/destinations/domain/entity/activities.dart';
import 'package:safarni/features/destinations/domain/repository/base_destantion_repository.dart';

class GetAllActivitiesUesCase {
  final BaseDestantionRepository baseDestantionRepository;

  GetAllActivitiesUesCase(this.baseDestantionRepository);

  Future<Either<Failuree, List<Activities>>> execute() async {
    return await baseDestantionRepository.getAllActivities();
  }
}

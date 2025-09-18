import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/destinations/domain/entity/activities.dart';
import 'package:safarni/features/destinations/domain/entity/destantion.dart';
import 'package:safarni/features/destinations/domain/entity/review.dart';

abstract class BaseDestantionRepository {
  Future<Either<Failuree, List<Review>>> getAllReviwes(int tourId);
  Future<Either<Failuree, List<Activities>>> getAllActivities();
  Future<Either<Failuree, Destantion>> getDestantion(int id);
}

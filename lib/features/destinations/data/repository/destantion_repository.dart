import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/destinations/data/data_source/destantion_remote_data_source.dart';
import 'package:safarni/features/destinations/domain/entity/activities.dart';
import 'package:safarni/features/destinations/domain/entity/destantion.dart';
import 'package:safarni/features/destinations/domain/entity/review.dart';
import 'package:safarni/features/destinations/domain/repository/base_destantion_repository.dart';

class DestantionRepository extends BaseDestantionRepository {
  final BaseDestantionRemoteDataSource baseDestantionRemoteDataSource;

  DestantionRepository(this.baseDestantionRemoteDataSource);
  @override
  Future<Either<Failuree, List<Activities>>> getAllActivities() async {
    final result = await baseDestantionRemoteDataSource.getAllActivities();
    try {
      return Right(result);
    } on ServerFailuree catch (failure) {
      return Left(ServerFailuree(failure.message));
    }
  }

  @override
  Future<Either<Failuree, List<Review>>> getAllReviwes(int tourId) async {
    final result = await baseDestantionRemoteDataSource.getAllReviwes(tourId);
    try {
      return Right(result);
    } on ServerFailuree catch (failure) {
      return Left(ServerFailuree(failure.message));
    }
  }

  @override
  Future<Either<Failuree, Destantion>> getDestantion(int id) async {
    final result = await baseDestantionRemoteDataSource.getDestantion(id);
    try {
      return Right(result);
    } on ServerFailuree catch (failure) {
      return Left(ServerFailuree(failure.message));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/details/domain/entity/review_entity.dart';

abstract class ReviewRepo {
  Future<void> addReview({required ReviewEntity review});
  Future<Either<Failure, List<ReviewEntity>>> getReviews();
}

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/details/domain/entity/review_entity.dart';
import 'package:safarni/features/rooms/details/domain/repo/review_repo.dart';

class ReviewRepoImpl extends ReviewRepo {
  @override
  Future<void> addReview({required ReviewEntity review}) async {
    final reviewModel = ReviewEntity(
      rate: review.rate,
      image: review.image,
      name: review.name,
      desc: review.desc,
      date: review.date,
    );
    try {
      final box = Hive.box<ReviewEntity>('review');
      box.add(reviewModel);
    } catch (e) {
      return Future.error(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReviewEntity>>> getReviews() async {
    try {
      final box = Hive.box<ReviewEntity>('review');
      final reviews = box.values.toList();
      return Right(reviews);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

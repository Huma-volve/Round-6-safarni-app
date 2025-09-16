import 'package:safarni/features/rooms/details/domain/entity/review_entity.dart';

ReviewEntity getReviewsDummy() {
  final ReviewEntity reviewEntity = ReviewEntity(
    rate: 0,
    image: '',
    name: '',
    desc: '',
    date: DateTime.now().toString(),
  );
  return reviewEntity;
}

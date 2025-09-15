import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safarni/features/rooms/details/domain/entity/review_entity.dart';
import 'package:safarni/features/rooms/details/domain/repo/review_repo.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit(this.reviewRepo) : super(AddReviewInitial());
  final ReviewRepo reviewRepo;

  Future<void> addReview({required ReviewEntity review}) async {
    emit(ReviewLoading());
    try {
      await reviewRepo.addReview(review: review);
      emit(AddReviewSuccess());
    } on Exception catch (e) {
      emit(AddReviewFailure(e.toString()));
    }
  }
}

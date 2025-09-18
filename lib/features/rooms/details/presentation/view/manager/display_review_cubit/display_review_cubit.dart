import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safarni/features/rooms/details/domain/entity/review_entity.dart';
import 'package:safarni/features/rooms/details/domain/repo/review_repo.dart';

part 'display_review_state.dart';

class DisplayReviewCubit extends Cubit<DisplayReviewState> {
  DisplayReviewCubit(this.reviewRepo) : super(DisplayReviewInitial());
  final ReviewRepo reviewRepo;
  int count = 0;
  void displayReview() async {
    emit((DisplayReviewLoading()));
    final result = await reviewRepo.getReviews();

    result.fold(
      (failure) =>
          emit(DisplayReviewFailure(errorMessage: failure.errorMessage)),
      (success) {
        count = success.length;
        emit(DisplayReviewSuccess(reviews: success));
      },
    );
  }
}

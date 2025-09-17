part of 'display_review_cubit.dart';

sealed class DisplayReviewState extends Equatable {
  const DisplayReviewState();

  @override
  List<Object> get props => [];
}

final class DisplayReviewInitial extends DisplayReviewState {}

final class DisplayReviewSuccess extends DisplayReviewState {
  final List<ReviewEntity> reviews;
  const DisplayReviewSuccess({required this.reviews});
}

final class DisplayReviewFailure extends DisplayReviewState {
  final String errorMessage;
  const DisplayReviewFailure({required this.errorMessage});
}

final class DisplayReviewLoading extends DisplayReviewState {}

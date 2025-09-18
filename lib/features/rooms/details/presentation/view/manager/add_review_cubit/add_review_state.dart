part of 'add_review_cubit.dart';

sealed class AddReviewState extends Equatable {
  const AddReviewState();

  @override
  List<Object> get props => [];
}

final class AddReviewInitial extends AddReviewState {}

final class AddReviewSuccess extends AddReviewState {}

final class AddReviewFailure extends AddReviewState {
  final String message;
  const AddReviewFailure(this.message);
}

final class ReviewLoading extends AddReviewState {}

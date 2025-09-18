part of 'destantion_cubit.dart';

abstract class DestantionState extends Equatable {
  const DestantionState();

  @override
  List<Object> get props => [];
}

class DestantionInitial extends DestantionState {}

class DestantionLoading extends DestantionState {}

class DestantionSuccess extends DestantionState {
  final Destantion destantion;
  const DestantionSuccess(this.destantion);
}

class DestantionError extends DestantionState {
  final String message;
  const DestantionError(this.message);
}

class ReviewsInitial extends DestantionState {}

class ReviewsLoading extends DestantionState {}

class ReviewsSuccess extends DestantionState {
  final List<Review> reviews;
  const ReviewsSuccess(this.reviews);
}

class ReviewsError extends DestantionState {
  final String message;
  const ReviewsError(this.message);
}

class ActivitiesInitial extends DestantionState {}

class ActivitiesLoading extends DestantionState {}

class ActivitiesSuccess extends DestantionState {
  final List<Activities> activities;
  const ActivitiesSuccess(this.activities);
}

class ActivitiesError extends DestantionState {
  final String message;
  const ActivitiesError(this.message);
}

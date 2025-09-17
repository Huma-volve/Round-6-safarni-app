part of 'recommended_tours_cubit.dart';

@immutable
sealed class RecommendedToursState {}

final class RecommendedToursInitial extends RecommendedToursState {}

final class RecommendedToursLoading extends RecommendedToursState {}

final class RecommendedToursLoaded extends RecommendedToursState {
  final List<RecommendedTourModel> tours;
  RecommendedToursLoaded({required this.tours});
}

final class RecommendedToursError extends RecommendedToursState {
  final String error;
  RecommendedToursError({required this.error});
}

final class CategoriesLoading extends RecommendedToursState {}

final class CategoriesLoaded extends RecommendedToursState {
  final List<CategoryModel> categories;
  CategoriesLoaded({required this.categories});
}

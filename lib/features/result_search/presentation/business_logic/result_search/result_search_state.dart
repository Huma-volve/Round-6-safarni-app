part of 'result_search_cubit.dart';

@immutable
sealed class ResultSearchState {}

final class ResultSearchInitial extends ResultSearchState {}

final class ResultSearchLoading extends ResultSearchState {}


final class ResultSearchLoaded extends ResultSearchState {
 final List<ResultItemModel> results;

  ResultSearchLoaded({required this.results});

}
final class ResultSearchError extends ResultSearchState {
  final String error;

  ResultSearchError({required this.error});
}
final class ResultIsFavourite extends ResultSearchState {
 final bool isFavourite;

  ResultIsFavourite({required this.isFavourite});

}



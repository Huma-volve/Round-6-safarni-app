part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoading extends FavouriteState {}

final class FavouriteLoaded extends FavouriteState {
  final List<FavouriteModel> favourites;

  FavouriteLoaded({required this.favourites});

}

final class FavouriteError extends FavouriteState {

  final String error;

  FavouriteError({required this.error});

}

